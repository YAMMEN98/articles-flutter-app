import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/features/ny_times/data/entities/ny_times_model.dart';
import 'package:ny_times_app/src/features/ny_times/domain/usecases/ny_times_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class NyTimesRepository {
  // Gent Ny Times Articles
  Future<Either<Failure, NyTimesModel>> getNyTimesData(NyTimesParams params);
}
