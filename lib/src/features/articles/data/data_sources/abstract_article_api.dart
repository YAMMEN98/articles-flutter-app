import 'package:ny_times_app/src/features/articles/domain/models/articles_params.dart';
import 'package:ny_times_app/src/features/articles/domain/models/ny_times_article_response_model.dart';
import 'package:ny_times_app/src/features/articles/domain/models/article_model.dart';
import 'package:ny_times_app/src/features/articles/domain/usecases/articles_usecase.dart';

abstract class AbstractArticleApi {
  // Get all ny times article
  Future<ApiResponse<List<ArticleModel>>> getArticles(
      ArticlesParams params);
}
