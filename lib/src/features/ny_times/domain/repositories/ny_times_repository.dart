import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/features/ny_times/domain/usecases/ny_times_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class NyTimesRepository {
  Future<Either<Failure, String>> nyTimes(NyTimesParams params);
}
