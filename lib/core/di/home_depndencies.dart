import 'package:hive_ce/hive_ce.dart';
import 'package:project_structure/core/connection/network_info.dart';
import 'package:project_structure/core/databases/api/api_consumer.dart';
import 'package:project_structure/core/di/service_locator.dart';
import 'package:project_structure/features/home/data/datasources/home_local_data_source.dart';
import 'package:project_structure/features/home/data/datasources/home_remote_data_source.dart';
import 'package:project_structure/features/home/data/models/home_model.dart';
import 'package:project_structure/features/home/data/repositories/home_repos_impl.dart';
import 'package:project_structure/features/home/domain/repositories/home_repos.dart';
import 'package:project_structure/features/home/presentation/cubit/home_cubit.dart';

void homeDepndencies() {
  // Data sources
  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSource(box: Hive.box<HomeModel>('homeBox')),
  );
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(api: getIt<ApiConsumer>()),
  );

  // Repository
  getIt.registerLazySingleton<HomeRepos>(
    () => HomeReposImpl(
      getIt<NetworkInfo>(),
      getIt<HomeRemoteDataSource>(),
      getIt<HomeLocalDataSource>(),
    ),
  );

  // Cubit
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(getIt<HomeRepos>()),
  );
}
