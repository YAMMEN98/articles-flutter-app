import 'package:dartz/dartz.dart';
import 'package:ny_times_app/src/core/network/error/exceptions.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/features/ny_times_articles/data/data_sources/ny_times_articles_api.dart';
import 'package:ny_times_app/src/features/ny_times_articles/data/entities/ny_times_articles_model.dart';
import 'package:ny_times_app/src/features/ny_times_articles/domain/repositories/ny_times_articles_repository.dart';
import 'package:ny_times_app/src/features/ny_times_articles/domain/usecases/ny_times_articles_usecase.dart';

class NyTimesArticlesRepositoryImpl extends NyTimesArticlesRepository {
  final NyTimesArticlesApi nyTimesApi;

  NyTimesArticlesRepositoryImpl(
    this.nyTimesApi,
  );

  // Gent Ny Times Articles
  @override
  Future<Either<Failure, List<NyTimesArticlesModel>>> getNyTimesArticles(
      NyTimesArticlesParams params) async {
    try {
      final result = await nyTimesApi.getNyTimesData(params);
      return Right(result.results ?? []);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
