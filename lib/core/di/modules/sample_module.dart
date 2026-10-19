import 'package:get_it/get_it.dart';
import 'package:project_structure/core/databases/api/api_consumer.dart';
import 'package:project_structure/features/sample/data/datasources/sample_remote_data_source.dart';
import 'package:project_structure/features/sample/data/repositories/sample_repos_impl.dart';
import 'package:project_structure/features/sample/domain/repositories/sample_repos.dart';
import 'package:project_structure/features/sample/presentation/cubit/sample_cubit.dart';

void registerSampleModule(GetIt getIt) {
  getIt.registerLazySingleton<SampleRemoteDataSource>(
    () => SampleRemoteDataSource(api: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<SampleRepos>(
    () => SampleReposImpl(getIt<SampleRemoteDataSource>()),
  );
  getIt.registerFactory<SampleCubit>(() => SampleCubit(getIt<SampleRepos>()));
}
