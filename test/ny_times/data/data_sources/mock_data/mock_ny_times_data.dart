import 'package:ny_times_app/src/features/ny_times/data/entities/ny_times_article_response_model.dart';
import 'package:ny_times_app/src/features/ny_times/data/entities/ny_times_model.dart';

ApiResponse<List<NyTimesModel>> mockNyTimesEmptyListData = ApiResponse(
  status: "OK",
  copyright:
      "Copyright (c) 2023 The New York Times Company.  All Rights Reserved.",
  numResults: 20,
  results: [],
);

ApiResponse<List<NyTimesModel>> mockNyTimesListData = ApiResponse(
  status: "OK",
  copyright:
      "Copyright (c) 2023 The New York Times Company.  All Rights Reserved.",
  numResults: 20,
  results: [
    NyTimesModel(
      id: 100000008872080,
    ),
  ],
);
