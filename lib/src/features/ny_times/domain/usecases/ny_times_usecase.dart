import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/core/util/usecases/usecase.dart';
import 'package:ny_times_app/src/features/ny_times/domain/repositories/ny_times_repository.dart';
import 'package:dartz/dartz.dart';

class NyTimesUseCase extends UseCase<String, NyTimesParams> {
  final NyTimesRepository repository;

NyTimesUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(NyTimesParams params) async {
    final result = await repository.nyTimes(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

class NyTimesParams {
  NyTimesParams();

  NyTimesParams.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data..removeWhere((key, value) => value == null);
  }
}
