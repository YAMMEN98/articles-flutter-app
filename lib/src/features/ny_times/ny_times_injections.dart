import 'package:ny_times_app/src/core/util/injections.dart';
import 'package:ny_times_app/src/features/ny_times/data/data_sources/ny_times_api.dart';
import 'data/data_sources/ny_times_shared_prefs.dart';
import 'data/repositories/ny_times_repo_empl.dart';
import 'domain/repositories/ny_times_repository.dart';
import 'domain/usecases/ny_times_usecase.dart';

initNyTimesInjections() {
  sl.registerFactory<NyTimesApi>(() => NyTimesApi());
  sl.registerFactory<NyTimesSharedPrefs>(() => NyTimesSharedPrefs(sl()));
  sl.registerFactory<NyTimesUseCase>(() => NyTimesUseCase(sl()));
  sl.registerFactory<NyTimesRepository>(() => NyTimesRepositoryImpl(sl(), sl()));
}
