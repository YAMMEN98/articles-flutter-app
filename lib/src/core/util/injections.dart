import 'package:get_it/get_it.dart';
import 'package:ny_times_app/src/core/network/dio_network.dart';
import 'package:ny_times_app/src/core/util/log/app_logger.dart';
import 'package:ny_times_app/src/features/ny_times/ny_times_injections.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common_feature/app_injections.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initSharedPrefsInjections();
  await initAppInjections();
  await initCoreInjections();
  await initNyTimesInjections();
}

initSharedPrefsInjections() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await sl.isReady<SharedPreferences>();
}

Future<void> initCoreInjections() async {
  initRootLogger();
  DioNetwork.initDio();
}
