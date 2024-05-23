import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:project_structure/core/cache/app_secure_storage.dart';
import 'package:project_structure/core/errors/failure.dart';
import 'package:project_structure/features/authentication/data/models/user_data_model.dart';
import 'package:project_structure/features/authentication/data/repositories/base_auth_repository.dart';
import 'package:project_structure/features/authentication/data/requests/login_request.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(AuthInitial());
  final BaseAuthRepository _authRepository;

  TextEditingController userEmailSignController = TextEditingController();
  String phoneNumberWithIsoCode = "";
  TextEditingController passwordLoginController = TextEditingController();
  Future<void> login() async {
    emit(LoginLoadingState());
    var result = await _authRepository.login(LoginRequest(
        email: userEmailSignController.text,
        phone: phoneNumberWithIsoCode,
        password: passwordLoginController.text));
    result.fold((failure) {
      emit(LoginFailureState(failure));
    }, (loginUser) async {
      _saveToken(loginUser.token);
      emit(LoginSuccessState(loginUser));
    });
  }

  Future<void> _saveToken(String token) async {
    try {
      await AppSecureStorage.instance.storeToken(token);
      debugPrint('token is saved $token');
    } on Exception catch (e) {
      debugPrint('Error when save token in shared preferences $e');
    }
  }
}
