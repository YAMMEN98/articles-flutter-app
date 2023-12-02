import 'package:dartz/dartz.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/core/util/usecases/usecase.dart';
import 'package:ny_times_app/src/features/articles/domain/models/article_model.dart';
import 'package:ny_times_app/src/features/articles/domain/repositories/abstract_articles_repository.dart';

class ArticlesUseCase extends UseCase<List<ArticleModel>, ArticlesParams> {
  final AbstractArticlesRepository repository;

  ArticlesUseCase(this.repository);

  @override
  Future<Either<Failure, List<ArticleModel>>> call(
      ArticlesParams params) async {
    final result = await repository.getArticles(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

// Required params for this use-case
class ArticlesParams {
  ArticlesParams({
    required this.period,
  });

  late final int period;

  ArticlesParams.fromJson(Map<String, dynamic> json) {
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['period'] = period;
    return _data;
  }
}
