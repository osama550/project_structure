import 'package:dio/dio.dart';
import 'package:project_structure/core/constant/end_points.dart';
import 'package:project_structure/core/api/api_service.dart';
import 'package:project_structure/features/authentication/data/models/user_data_model.dart';
import 'package:project_structure/features/authentication/data/requests/login_request.dart';

import 'base_auth_remote_data_source.dart';

class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final ApiService _apiService;

  AuthRemoteDataSource(
    this._apiService,
  );
  Future<dynamic> _postRequest({required String endPoint, dynamic data}) async {
    Response response = await _apiService.post(
      endPoint: endPoint,
      data: data,
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception();
    }
  }

  @override
  Future<UserDataModel> login(LoginRequest request) async {
    final json = await _postRequest(
      endPoint: AppEndPoints.login,
      data: request.toJson(),
    );
    return UserDataModel.fromJson(json);
  }
}
