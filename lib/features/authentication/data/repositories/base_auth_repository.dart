import 'package:dartz/dartz.dart';
import 'package:project_structure/core/errors/failure.dart';
import 'package:project_structure/features/authentication/data/models/user_data_model.dart';
import 'package:project_structure/features/authentication/data/requests/login_request.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, UserDataModel>> login(LoginRequest request);
}
