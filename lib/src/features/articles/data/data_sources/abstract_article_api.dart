import 'package:ny_times_app/src/features/articles/data/entities/ny_times_article_response_model.dart';
import 'package:ny_times_app/src/features/articles/data/entities/article_model.dart';
import 'package:ny_times_app/src/features/articles/domain/usecases/articles_usecase.dart';

abstract class AbstractArticleApi {
  // Get all ny times article
  Future<ApiResponse<List<ArticleModel>>> getArticles(
      ArticlesParams params);
}
