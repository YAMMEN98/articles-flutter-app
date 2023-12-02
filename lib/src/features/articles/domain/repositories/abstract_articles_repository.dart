import 'package:dartz/dartz.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/features/articles/domain/models/article_model.dart';
import 'package:ny_times_app/src/features/articles/domain/usecases/articles_usecase.dart';

abstract class AbstractArticlesRepository {
  // Gent Ny Times Articles
  Future<Either<Failure, List<ArticleModel>>> getArticles(
      ArticlesParams params);
}
