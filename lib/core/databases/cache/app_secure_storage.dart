import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_structure/core/errors/exceptions.dart';

abstract class AppSecureStorage {
  Future<void> init();
  Future<void> saveToken(String token);
  Future<String?> getToken();
  bool get hasToken;
  Future<void> removeToken();
  Future<void> clearAll();
}

class AppSecureStorageImpl implements AppSecureStorage {
  static const String _tokenKey = 'token_key';

  late final FlutterSecureStorage _storage;
  String? _cachedToken;
  @override
  Future<void> init() async {
    try {
      _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
      _cachedToken = await _storage.read(key: _tokenKey);
    } catch (e) {
      throw CacheException(
          errorMessage: 'Failed to initialize secure storage: $e');
    }
  }

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
        resetOnError: true,
      );
  @override
  Future<void> saveToken(String token) async {
    try {
      await _storage.write(key: _tokenKey, value: token);
      _cachedToken = token;
    } catch (e) {
      throw CacheException(errorMessage: 'Failed to save token: $e');
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      _cachedToken ??= await _storage.read(key: _tokenKey);
      return _cachedToken;
    } catch (e) {
      throw CacheException(errorMessage: 'Failed to get token: $e');
    }
  }

  @override
  bool get hasToken => _cachedToken != null;

  @override
  Future<void> removeToken() async {
    try {
      await _storage.delete(key: _tokenKey);
      _cachedToken = null;
    } catch (e) {
      throw CacheException(errorMessage: 'Failed to remove token: $e');
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      await _storage.deleteAll();
      _cachedToken = null;
    } catch (e) {
      throw CacheException(errorMessage: 'Failed to clear storage: $e');
    }
  }
}
