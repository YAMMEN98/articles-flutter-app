import 'package:ny_times_app/src/core/network/dio_network.dart';
import 'package:ny_times_app/src/core/network/error/dio_error_handler.dart';
import 'package:ny_times_app/src/core/network/error/exceptions.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/features/ny_times/domain/usecases/ny_times_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NyTimesApi {
  /// NyTimes method
  Future<Either<Failure, String>> nyTimes(
  NyTimesParams params) async {
    try {
      final result = (await DioNetwork.appAPI.get("")).data;
      return Right("");

      /// Handle Success/Failure Response To Return Right Or Left
      // if (result['code'] == "0" || result['code'] == 0) {
      //   return Right("");
      // } else {
      //   return Left(ServerFailure(result['msg'] ?? S.of(navigatorKey.currentContext!).server_error, null));
      // }
    } on DioError catch (e) {
      throw ServerException(handleDioError(e), e.response?.statusCode);
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
