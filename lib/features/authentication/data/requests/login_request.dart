import 'package:equatable/equatable.dart';

class LoginRequest extends Equatable {
  final String? email;
  final String? phone;
  final String password;

  const LoginRequest({this.email, this.phone, required this.password});

  Map<String, dynamic> toJson() => {
        if (email != null && email != '') 'email': email as String,
        if (phone != null && phone != '') 'phone': phone as String,
        'password': password,
      };

  @override
  List<Object?> get props {
    return [
      if (email != null && email != '') email as String,
      password,
      if (phone != null && phone != '') phone as String,
    ];
  }
}
