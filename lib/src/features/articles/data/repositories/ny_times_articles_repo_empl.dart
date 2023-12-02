import 'package:dartz/dartz.dart';
import 'package:ny_times_app/src/core/network/error/exceptions.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/features/articles/data/data_sources/articles_impl_api.dart';
import 'package:ny_times_app/src/features/articles/data/entities/article_model.dart';
import 'package:ny_times_app/src/features/articles/domain/repositories/ny_times_articles_repository.dart';
import 'package:ny_times_app/src/features/articles/domain/usecases/ny_times_articles_usecase.dart';

class NyTimesArticlesRepositoryImpl extends NyTimesArticlesRepository {
  final ArticlesImplApi nyTimesApi;

  NyTimesArticlesRepositoryImpl(
    this.nyTimesApi,
  );

  // Gent Ny Times Articles
  @override
  Future<Either<Failure, List<ArticleModel>>> getNyTimesArticles(
      NyTimesArticlesParams params) async {
    try {
      final result = await nyTimesApi.getArticles(params);
      return Right(result.results ?? []);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
