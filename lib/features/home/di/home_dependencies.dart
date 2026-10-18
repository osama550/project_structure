import 'package:hive_ce/hive_ce.dart';
import 'package:project_structure/core/connection/network_info.dart';
import 'package:project_structure/core/databases/api/api_consumer.dart';
import 'package:project_structure/core/di/service_locator.dart';
import 'package:project_structure/features/home/data/datasources/home_local_data_source.dart';
import 'package:project_structure/features/home/data/datasources/home_remote_data_source.dart';
import 'package:project_structure/features/home/data/models/home_model.dart';
import 'package:project_structure/features/home/data/repositories/home_repos_impl.dart';
import 'package:project_structure/features/home/domain/repositories/home_repos.dart';
import 'package:project_structure/features/home/domain/usecases/get_home_usecase.dart';
import 'package:project_structure/features/home/presentation/cubit/home_cubit.dart';

/// Opens the feature's Hive box. Adapters are registered once in HiveConfig.
Future<void> homeDependencies() async {
  final box = await Hive.openBox<HomeModel>(HomeLocalDataSource.boxName);

  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSource(box: box),
  );
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(api: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<HomeRepos>(
    () => HomeReposImpl(
      getIt<NetworkInfo>(),
      getIt<HomeRemoteDataSource>(),
      getIt<HomeLocalDataSource>(),
    ),
  );
  getIt.registerLazySingleton<GetHomeUseCase>(
    () => GetHomeUseCase(getIt<HomeRepos>()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<GetHomeUseCase>()));
}
