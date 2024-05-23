import 'package:project_structure/features/authentication/data/models/user_data_model.dart';
import 'package:project_structure/features/authentication/data/requests/login_request.dart';

abstract class BaseAuthRemoteDataSource {
  Future<UserDataModel> login(LoginRequest request);
}
