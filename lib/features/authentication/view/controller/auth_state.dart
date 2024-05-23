part of 'auth_cubit.dart';

class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

//login state
class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final UserDataModel loginModel;

  const LoginSuccessState(this.loginModel);
}

class LoginFailureState extends AuthState {
  final Failure errorMessage;

  const LoginFailureState(this.errorMessage);
}
