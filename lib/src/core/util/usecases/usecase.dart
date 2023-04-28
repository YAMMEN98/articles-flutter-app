import 'package:dartz/dartz.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}
