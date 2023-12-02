import 'package:dartz/dartz.dart';
import 'package:ny_times_app/src/core/network/error/failures.dart';
import 'package:ny_times_app/src/core/util/usecases/usecase.dart';
import 'package:ny_times_app/src/features/articles/data/entities/article_model.dart';
import 'package:ny_times_app/src/features/articles/domain/repositories/abstract_articles_repository.dart';

class NyTimesArticlesUseCase
    extends UseCase<List<ArticleModel>, NyTimesArticlesParams> {
  final AbstractArticlesRepository repository;

  NyTimesArticlesUseCase(this.repository);

  @override
  Future<Either<Failure, List<ArticleModel>>> call(
      NyTimesArticlesParams params) async {
    final result = await repository.getNyTimesArticles(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

class NyTimesArticlesParams {
  NyTimesArticlesParams({
    required this.period,
  });

  late final int period;

  NyTimesArticlesParams.fromJson(Map<String, dynamic> json) {
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['period'] = period;
    return _data;
  }
}
