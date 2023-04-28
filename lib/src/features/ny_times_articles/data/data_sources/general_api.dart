import 'package:ny_times_app/src/features/ny_times_articles/data/entities/ny_times_article_response_model.dart';
import 'package:ny_times_app/src/features/ny_times_articles/data/entities/ny_times_articles_model.dart';
import 'package:ny_times_app/src/features/ny_times_articles/domain/usecases/ny_times_articles_usecase.dart';

abstract class GeneralApi {
  // Get all ny times article
  Future<ApiResponse<List<NyTimesArticlesModel>>> getNyTimesData(
      NyTimesArticlesParams params);
}
