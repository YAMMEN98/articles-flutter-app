import 'package:dartz/dartz.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/features/articles/data/entities/article_model.dart';
import 'package:ny_times_app/src/features/articles/domain/usecases/ny_times_articles_usecase.dart';

abstract class NyTimesArticlesRepository {
  // Gent Ny Times Articles
  Future<Either<Failure, List<ArticleModel>>> getNyTimesArticles(
      NyTimesArticlesParams params);
}
