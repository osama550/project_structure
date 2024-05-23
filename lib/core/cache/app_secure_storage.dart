import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorage {
  AppSecureStorage._();
  static const String _tokenKey = 'TOKEN';
  String? token;
  static final instance = AppSecureStorage._();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Stores the provided token in the storage.
  Future<void> storeToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  // Asynchronous function to retrieve and return a token from storage.
  Future<String?>? getToken() async {
    token = await _storage.read(key: _tokenKey);
    return token;
  }

  // Delete a token from storage.
  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }
}
