import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:project_structure/core/connection/network_info.dart';
import 'package:project_structure/core/databases/api/api_consumer.dart';
import 'package:project_structure/core/databases/api/dio_consumer.dart';
import 'package:project_structure/core/databases/cache/app_secure_storage.dart';
import 'package:project_structure/core/databases/cache/cache_helper.dart';
import 'package:project_structure/core/databases/cache/hive_config.dart';
import 'package:project_structure/core/di/home_depndencies.dart';

final GetIt getIt = GetIt.instance;

Future<void> setUpServiceLocator() async {
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer());
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer());
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelperImpl());
  getIt.registerLazySingleton<AppSecureStorage>(() => AppSecureStorageImpl());
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnection()));
  getIt.registerLazySingleton<HiveConfig>(() => HiveConfig());

  homeDepndencies();
}
