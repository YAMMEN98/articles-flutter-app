import 'package:ny_times_app/main.dart';
import 'package:ny_times_app/src/core/network/dio_network.dart';
import 'package:ny_times_app/src/core/network/error/dio_error_handler.dart';
import 'package:ny_times_app/src/core/network/error/exceptions.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/core/translations/l10n.dart';
import 'package:ny_times_app/src/core/util/constant/network_constant.dart';
import 'package:ny_times_app/src/features/ny_times_articles/data/entities/ny_times_article_response_model.dart';
import 'package:ny_times_app/src/features/ny_times_articles/data/entities/ny_times_articles_model.dart';
import 'package:ny_times_app/src/features/ny_times_articles/domain/usecases/ny_times_articles_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NyTimesArticlesApi {
  final Dio dio;

  CancelToken cancelToken = CancelToken();

  NyTimesArticlesApi(this.dio);

  /// NyTimes method
  Future<ApiResponse<List<NyTimesArticlesModel>>> getNyTimesData(
      NyTimesArticlesParams params) async {
    try {
      final result = (await dio.get(
        getNyTimeArticle(params.period),
      ));
      if (result.data == null)
        throw ServerException("Unknown Error", result.statusCode);

      return ApiResponse.fromJson<List<NyTimesArticlesModel>>(
          result.data, NyTimesArticlesModel.fromJsonList);
    } on DioError catch (e) {
      if (e.type == DioErrorType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException catch (e) {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
