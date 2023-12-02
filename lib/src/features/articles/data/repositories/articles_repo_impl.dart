import 'package:dartz/dartz.dart';
import 'package:ny_times_app/src/core/network/error/exceptions.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/features/articles/data/data_sources/articles_impl_api.dart';
import 'package:ny_times_app/src/features/articles/domain/entities/article_model.dart';
import 'package:ny_times_app/src/features/articles/domain/repositories/abstract_articles_repository.dart';
import 'package:ny_times_app/src/features/articles/domain/usecases/articles_usecase.dart';

class ArticlesRepositoryImpl extends AbstractArticlesRepository {
  final ArticlesImplApi articlesApi;

  ArticlesRepositoryImpl(
    this.articlesApi,
  );

  // Gent Ny Times Articles
  @override
  Future<Either<Failure, List<ArticleModel>>> getArticles(
      ArticlesParams params) async {
    try {
      final result = await articlesApi.getArticles(params);
      return Right(result.results ?? []);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
