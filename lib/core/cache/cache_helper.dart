import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // Set the provided language code in the shared preferences for language caching.
  Future<void> cacheLanguageCode(String languageCode) async {
    sharedPreferences.setString("lang", languageCode);
  }

  // Get the cached language code from shared preferences if available,
  // otherwise return the language code of the device locale.
  Future<String> getCachedLanguageCode() async {
    final cachedLanguageCode = sharedPreferences.getString("lang");
    final deviceLocale = PlatformDispatcher.instance.locale;
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return deviceLocale.languageCode;
    }
  }

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }
    if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }
}
