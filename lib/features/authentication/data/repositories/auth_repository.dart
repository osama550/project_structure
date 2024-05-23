import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project_structure/core/errors/failure.dart';
import 'package:project_structure/core/errors/server_failure.dart';
import 'package:project_structure/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:project_structure/features/authentication/data/models/user_data_model.dart';
import 'package:project_structure/features/authentication/data/repositories/base_auth_repository.dart';
import 'package:project_structure/features/authentication/data/requests/login_request.dart';

class AuthRepository implements BaseAuthRepository {
  final AuthRemoteDataSource _dataSource;
  AuthRepository(this._dataSource);
  Future<Either<Failure, T>> _execute<T>(Future<T> Function() action) async {
    try {
      T result = await action();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerError.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, UserDataModel>> login(LoginRequest request) async =>
      _execute(() => _dataSource.login(request));
}
