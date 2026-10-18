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

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(resetOnError: true),
  );
  String? _cachedToken;

  /// Warms the token cache. Optional: [getToken] reads lazily, so the storage
  /// is usable even if this was never called.
  @override
  Future<void> init() async {
    try {
      _cachedToken = await _storage.read(key: _tokenKey);
    } catch (e) {
      throw CacheException(
          errorMessage: 'Failed to initialize secure storage: $e');
    }
  }

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
