import 'package:project_structure/core/api/api_service.dart';
import 'package:project_structure/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:project_structure/features/authentication/data/repositories/auth_repository.dart';

import 'service_locator.dart';

void registerAuthDepndencies() {
  //* DATA SOURCE
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(sl<ApiService>()));
  //* REPOSITORY
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepository(sl<AuthRemoteDataSource>()));
}
