import 'package:dartz/dartz.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/features/articles/domain/models/article_model.dart';

Right<Failure, List<ArticleModel>> expectedArticlesEmptyListData =
    Right(<ArticleModel>[]);

Right<Failure, List<ArticleModel>> expectedArticlesListData = Right(
  <ArticleModel>[
    ArticleModel(
      id: 100000008872080,
    ),
    ArticleModel(
      id: 100000008852162,
    ),
  ],
);
