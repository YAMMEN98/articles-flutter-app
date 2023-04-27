import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ny_times_app/src/features/ny_times_articles/data/entities/ny_times_articles_model.dart';
import 'package:ny_times_app/src/features/ny_times_articles/domain/usecases/ny_times_articles_usecase.dart';

abstract class NyTimesArticlesRepository {
  // Gent Ny Times Articles
  Future<Either<Failure, List<NyTimesArticlesModel>>> getNyTimesData(NyTimesArticlesParams params);
}
