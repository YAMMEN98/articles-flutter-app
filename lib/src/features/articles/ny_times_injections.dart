import 'package:ny_times_app/src/core/network/dio_network.dart';
import 'package:ny_times_app/src/core/util/injections.dart';
import 'package:ny_times_app/src/features/articles/data/data_sources/articles_impl_api.dart';

import 'data/data_sources/articles_shared_prefs.dart';
import 'data/repositories/articles_repo_impl.dart';
import 'domain/repositories/abstract_articles_repository.dart';
import 'domain/usecases/articles_usecase.dart';

initNyTimesArticlesInjections() {
  sl.registerFactory<ArticlesImplApi>(
      () => ArticlesImplApi(DioNetwork.appAPI));
  sl.registerFactory<ArticlesSharedPrefs>(
      () => ArticlesSharedPrefs(sl()));
  sl.registerFactory<ArticlesUseCase>(
      () => ArticlesUseCase(sl()));
  sl.registerFactory<AbstractArticlesRepository>(
      () => ArticlesRepositoryImpl(sl()));
}
