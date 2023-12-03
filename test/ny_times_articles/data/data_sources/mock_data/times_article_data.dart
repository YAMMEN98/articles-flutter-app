import 'package:ny_times_app/src/features/articles/domain/models/article_model.dart';
import 'package:ny_times_app/src/features/articles/domain/models/article_response_model.dart';

ApiResponse<List<ArticleModel>> mockNyTimesEmptyListData = ApiResponse(
  status: "OK",
  copyright:
      "Copyright (c) 2023 The New York Times Company.  All Rights Reserved.",
  numResults: 20,
  results: [],
);

ApiResponse<List<ArticleModel>> mockNyTimesListData = ApiResponse(
  status: "OK",
  copyright:
      "Copyright (c) 2023 The New York Times Company.  All Rights Reserved.",
  numResults: 20,
  results: [
    ArticleModel(
      id: 100000008872080,
    ),
  ],
);
