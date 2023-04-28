import 'package:dartz/dartz.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/features/ny_times_articles/data/entities/ny_times_articles_model.dart';

Right<Failure, List<NyTimesArticlesModel>> mockNyTimesEmptyListData =
    Right(<NyTimesArticlesModel>[]);

Right<Failure, List<NyTimesArticlesModel>> mockNyTimesListData = Right(
  <NyTimesArticlesModel>[
    NyTimesArticlesModel(
      id: 100000008872080,
    ),
    NyTimesArticlesModel(
      id: 100000008852162,
    ),
  ],
);
