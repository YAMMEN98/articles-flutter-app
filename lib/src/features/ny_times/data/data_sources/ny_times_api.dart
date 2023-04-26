import 'package:ny_times_app/src/core/network/dio_network.dart';
import 'package:ny_times_app/src/core/network/error/dio_error_handler.dart';
import 'package:ny_times_app/src/core/network/error/exceptions.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/core/util/constant/network_constant.dart';
import 'package:ny_times_app/src/features/ny_times/data/entities/ny_times_model.dart';
import 'package:ny_times_app/src/features/ny_times/domain/usecases/ny_times_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NyTimesApi {
  /// NyTimes method
  Future<Either<Failure, NyTimesModel>> getNyTimesData(
      NyTimesParams params) async {
    try {
      final result = (await DioNetwork.appAPI.get(
        getNyTimeArticle(params.period),
      )).data;
      return Right(NyTimesModel.fromJson(result['results']));
    } on DioError catch (e) {
      throw ServerException(handleDioError(e), e.response?.statusCode);
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
