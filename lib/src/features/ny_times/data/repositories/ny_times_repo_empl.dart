import 'package:ny_times_app/src/core/network/error/exceptions.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/features/ny_times/data/data_sources/ny_times_api.dart';
import 'package:ny_times_app/src/features/ny_times/data/data_sources/ny_times_shared_prefs.dart';
import 'package:ny_times_app/src/features/ny_times/domain/repositories/ny_times_repository.dart';
import 'package:ny_times_app/src/features/ny_times/domain/usecases/ny_times_usecase.dart';
import 'package:dartz/dartz.dart';

class NyTimesRepositoryImpl extends NyTimesRepository {
  final NyTimesApi nyTimesApi;
  final NyTimesSharedPrefs nyTimesPrefs;

  NyTimesRepositoryImpl(this.nyTimesApi, this.nyTimesPrefs);

  /// NyTimes method
  @override
  Future<Either<Failure, String>> nyTimes(NyTimesParams params) async {
    try {
      final result = await nyTimesApi.nyTimes(params);
      return result.fold((l) {
        return Left(ServerFailure(l.errorMessage, null));
      }, (r) {
        return Right(r);
      });
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
