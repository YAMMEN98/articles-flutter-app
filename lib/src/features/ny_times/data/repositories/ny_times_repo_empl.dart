import 'package:ny_times_app/src/core/network/error/exceptions.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/features/ny_times/data/data_sources/ny_times_api.dart';
import 'package:ny_times_app/src/features/ny_times/data/data_sources/ny_times_shared_prefs.dart';
import 'package:ny_times_app/src/features/ny_times/data/entities/ny_times_model.dart';
import 'package:ny_times_app/src/features/ny_times/domain/repositories/ny_times_repository.dart';
import 'package:ny_times_app/src/features/ny_times/domain/usecases/ny_times_usecase.dart';
import 'package:dartz/dartz.dart';

class NyTimesRepositoryImpl extends NyTimesRepository {
  final NyTimesApi nyTimesApi;
  final NyTimesSharedPrefs nyTimesPrefs;

  NyTimesRepositoryImpl(this.nyTimesApi, this.nyTimesPrefs);

  // Gent Ny Times Articles
  @override
  Future<Either<Failure, List<NyTimesModel>>> getNyTimesData(NyTimesParams params) async {
    try {
      final result = await nyTimesApi.getNyTimesData(params);
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
