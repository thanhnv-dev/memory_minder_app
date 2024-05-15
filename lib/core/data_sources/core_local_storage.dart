import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

enum CoreLocalStorageKey {
  token("token"),
  refreshToken("refreshToken"),
  isDarkTheme("isDarkTheme");

  final String name;
  const CoreLocalStorageKey(this.name);

  String get displayName {
    return name;
  }
}

abstract class CoreLocalStorageDataSource {
  Future<String?> getToken();
  Future<void> setToken(String token);
  Future<void> removeToken();
  Future<bool?> getIsDarkTheme();
  Future<void> setIsDarkTheme(bool state);
  Future<void> removeIsDarkTheme();
}

class CoreLocalStorageDataSourceImpl implements CoreLocalStorageDataSource {
  @override
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final tokenEncoded = prefs.getString(CoreLocalStorageKey.token.name);
      if (tokenEncoded == null) {
        return null;
      } else {
        return jsonDecode(tokenEncoded);
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(CoreLocalStorageKey.token.name, jsonEncode(token));
  }

  @override
  Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(CoreLocalStorageKey.token.name);
  }

  @override
  Future<bool?> getIsDarkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final isDarkThemeEncoded = prefs.getBool(CoreLocalStorageKey.isDarkTheme.name);
      if (isDarkThemeEncoded == null) {
        return null;
      } else {
        return isDarkThemeEncoded;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setIsDarkTheme(bool state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(CoreLocalStorageKey.isDarkTheme.name, state);
  }

  @override
  Future<void> removeIsDarkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(CoreLocalStorageKey.isDarkTheme.name);
  }
}
