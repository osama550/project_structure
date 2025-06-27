import 'dart:developer';
import 'dart:ui';

import 'package:project_structure/core/databases/cache/app_secure_storage.dart';
import 'package:project_structure/core/di/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  Future<void> init();
  Future<void> cacheLanguage(String languageCode);
  Future<String> getCachedLanguage();
  Future<bool> saveData({required String key, required dynamic value});
  dynamic getData({required String key});
  Future<bool> clearData();
}

class CacheHelperImpl implements CacheHelper {
  late SharedPreferences sharedPreferences;

  static const String _hasRunBeforeKey = '_has_run_before';

  @override
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    final hasRunBefore = sharedPreferences.getBool(_hasRunBeforeKey) ?? false;
    final secureStorage = getIt<AppSecureStorage>();

    if (!hasRunBefore) {
      await secureStorage.init();
      await secureStorage.clearAll();
      await sharedPreferences.setBool(_hasRunBeforeKey, true);
    } else {
      await secureStorage.init();
    }

    for (final key in sharedPreferences.getKeys()) {
      log('Key: $key, Value: ${sharedPreferences.get(key)}');
    }
  }

  @override
  Future<void> cacheLanguage(String languageCode) async {
    await sharedPreferences.setString("lang", languageCode);
  }

  @override
  Future<String> getCachedLanguage() async {
    final cachedLanguageCode = sharedPreferences.getString("lang");
    final deviceLocale = PlatformDispatcher.instance.locale;

    return cachedLanguageCode ?? deviceLocale.languageCode;
  }

  @override
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value == null) {
      log('Attempted to save null value for key: $key');
      return false;
    }

    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    }

    log('Unsupported data type for key: $key');
    return false;
  }

  @override
  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  @override
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }
}
