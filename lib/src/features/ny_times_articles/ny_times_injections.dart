import 'package:ny_times_app/src/core/network/dio_network.dart';
import 'package:ny_times_app/src/core/util/injections.dart';
import 'package:ny_times_app/src/features/ny_times_articles/data/data_sources/ny_times_articles_api.dart';
import 'data/data_sources/ny_times_articles_shared_prefs.dart';
import 'data/repositories/ny_times_articles_repo_empl.dart';
import 'domain/repositories/ny_times_articles_repository.dart';
import 'domain/usecases/ny_times_articles_usecase.dart';

initNyTimesArticlesInjections() {
  sl.registerFactory<NyTimesArticlesApi>(() => NyTimesArticlesApi(DioNetwork.appAPI));
  sl.registerFactory<NyTimesArticlesSharedPrefs>(() => NyTimesArticlesSharedPrefs(sl()));
  sl.registerFactory<NyTimesArticlesUseCase>(() => NyTimesArticlesUseCase(sl()));
  sl.registerFactory<NyTimesArticlesRepository>(() => NyTimesArticlesRepositoryImpl(sl(), sl()));
}
