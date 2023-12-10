import 'package:ny_times_app/src/core/network/dio_network.dart';
import 'package:ny_times_app/src/core/utils/injections.dart';
import 'package:ny_times_app/src/features/articles/data/data_sources/remote/abstract_article_api.dart';
import 'package:ny_times_app/src/features/articles/data/data_sources/remote/articles_impl_api.dart';
import 'package:ny_times_app/src/features/articles/domain/repositories/abstract_articles_repository.dart';
import 'data/data_sources/local/articles_shared_prefs.dart';
import 'data/repositories/articles_repo_impl.dart';
import 'domain/usecases/articles_usecase.dart';

initArticlesInjections() {
  sl.registerSingleton<ArticlesImplApi>(ArticlesImplApi(DioNetwork.appAPI));
  sl.registerSingleton<AbstractArticlesRepository>(ArticlesRepositoryImpl(sl()));
  sl.registerSingleton<ArticlesSharedPrefs>(ArticlesSharedPrefs(sl()));
  sl.registerSingleton<ArticlesUseCase>(ArticlesUseCase(sl()));
}
