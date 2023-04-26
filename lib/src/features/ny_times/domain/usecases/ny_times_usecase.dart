import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/core/util/usecases/usecase.dart';
import 'package:ny_times_app/src/features/ny_times/data/entities/ny_times_model.dart';
import 'package:ny_times_app/src/features/ny_times/domain/repositories/ny_times_repository.dart';
import 'package:dartz/dartz.dart';

class NyTimesUseCase extends UseCase<List<NyTimesModel>, NyTimesParams> {
  final NyTimesRepository repository;

NyTimesUseCase(this.repository);

  @override
  Future<Either<Failure, List<NyTimesModel>>> call(NyTimesParams params) async {
    final result = await repository.getNyTimesData(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}


class NyTimesParams {
  NyTimesParams({
    required this.period,
  });
  late final int period;

  NyTimesParams.fromJson(Map<String, dynamic> json){
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['period'] = period;
    return _data;
  }
}

