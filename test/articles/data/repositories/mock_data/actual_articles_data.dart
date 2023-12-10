import 'package:ny_times_app/src/features/articles/domain/models/article_model.dart';
import 'package:ny_times_app/src/features/articles/domain/models/article_response_model.dart';

ApiResponse<List<ArticleModel>> actualArticlesFailedOrEmptyListData = ApiResponse(
  status: null,
  copyright: null,
  numResults: null,
  results: null,
);

ApiResponse<List<ArticleModel>> actualArticlesListData = ApiResponse(
  status: null,
  copyright: null,
  numResults: null,
  results: [
    ArticleModel(
      id: 100000008872080,
    ),
    ArticleModel(
      id: 100000008852162,
    ),
  ],
);
