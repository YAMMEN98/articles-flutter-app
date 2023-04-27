
import 'package:ny_times_app/src/features/ny_times_articles/data/entities/ny_times_article_response_model.dart';
import 'package:ny_times_app/src/features/ny_times_articles/data/entities/ny_times_articles_model.dart';

ApiResponse<List<NyTimesArticlesModel>> mockNyTimesEmptyListData = ApiResponse(
  status: "OK",
  copyright:
      "Copyright (c) 2023 The New York Times Company.  All Rights Reserved.",
  numResults: 20,
  results: [],
);

ApiResponse<List<NyTimesArticlesModel>> mockNyTimesListData = ApiResponse(
  status: "OK",
  copyright:
      "Copyright (c) 2023 The New York Times Company.  All Rights Reserved.",
  numResults: 20,
  results: [
    NyTimesArticlesModel(
      id: 100000008872080,
    ),
  ],
);
