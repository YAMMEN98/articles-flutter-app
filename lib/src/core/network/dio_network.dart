import 'dart:async';
import 'dart:convert';

import 'package:ny_times_app/src/core/common_feature/domain/entities/log_tags.dart';
import 'package:ny_times_app/src/core/network/logger_interceptor.dart';
import 'package:ny_times_app/src/core/util/log/app_logger.dart';
import 'package:ny_times_app/src/core/util/constant/network_constant.dart';
import 'package:ny_times_app/src/core/util/helper.dart';
import 'package:ny_times_app/src/core/util/injections.dart';
import 'package:ny_times_app/src/core/util/log/log_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_logs/flutter_logs.dart';

class DioNetwork {
  static late Dio appAPI;
  static late Dio retryAPI;

  static void initDio() {
    appAPI = Dio(baseOptions(apiUrl));
    appAPI.interceptors.add(loggerInterceptor());
    appAPI.interceptors.add(appQueuedInterceptorsWrapper());

    retryAPI = Dio(baseOptions(apiUrl));
    retryAPI.interceptors.add(loggerInterceptor());
    retryAPI.interceptors.add(interceptorsWrapper());
  }

  static LoggerInterceptor loggerInterceptor() {
    return LoggerInterceptor(
      logger,
      request: true,
      requestBody: true,
      error: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: true,
    );
  }

  ///__________App__________///

  /// App Api Queued Interceptor
  static QueuedInterceptorsWrapper appQueuedInterceptorsWrapper() {
    return QueuedInterceptorsWrapper(
      onRequest: (RequestOptions options, r) async {
        Map<String, dynamic> headers = Helper.getHeaders();

        if (kDebugMode) {
          print("Headers");
          print(json.encode(headers));
        }
        options.headers = headers;
        appAPI.options.headers = headers;

        sl<LogController>()
            .log(LogTags.request, json.encode(options.queryParameters), LogLevel.INFO);
        return r.next(options);
      },
      onError: (error, handler) async {
        sl<LogController>().log(
            LogTags.error, json.encode(error.response?.data), LogLevel.INFO);
        try {
          return handler.next(error);
        } catch (e) {
          return handler.reject(error);
          // onUnexpectedError(handler, error);
        }
      },
      onResponse: (Response<dynamic> response,
          ResponseInterceptorHandler handler) async {
        sl<LogController>()
            .log(LogTags.response, json.encode(response.data), LogLevel.INFO);
        return handler.next(response);
      },
    );
  }

  /// App interceptor
  static InterceptorsWrapper interceptorsWrapper() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, r) async {
        Map<String, dynamic> headers = Helper.getHeaders();

        options.headers = headers;
        appAPI.options.headers = headers;

        sl<LogController>()
            .log(LogTags.request, json.encode(options.queryParameters), LogLevel.INFO);
        return r.next(options);
      },
      onResponse: (response, handler) async {
        sl<LogController>()
            .log(LogTags.response, json.encode(response.data), LogLevel.INFO);

        if ("${(response.data["code"] ?? "0")}" != "0") {
          return handler.resolve(response);
          // return handler.reject(DioError(requestOptions: response.requestOptions, response: response, error: response, type: DioErrorType.response));
        } else {
          return handler.next(response);
        }
      },
      onError: (error, handler) {
        sl<LogController>().log(
            LogTags.error, json.encode(error.response?.data), LogLevel.ERROR);
        try {
          return handler.next(error);
        } catch (e) {
          return handler.reject(error);
          // onUnexpectedError(handler, error);
        }
      },
    );
  }

  /// Retry app api
  static Future<Response> _retry(Response response) async {
    final options = Options(
      method: response.requestOptions.method,
      headers: Helper.getHeaders(),
    );
    sl<LogController>().log(LogTags.error,
        json.encode(response.requestOptions.data), LogLevel.ERROR);

    return (await DioNetwork.retryAPI.request(response.requestOptions.path,
        data: response.requestOptions.data,
        queryParameters: response.requestOptions.queryParameters,
        options: options));
  }

  static BaseOptions baseOptions(String url) {
    Map<String, dynamic> headers = Helper.getHeaders();

    return BaseOptions(
        baseUrl: url,
        validateStatus: (s) {
          return s! < 300;
        },
        headers: headers..removeWhere((key, value) => value == null),
        responseType: ResponseType.json);
  }
}
