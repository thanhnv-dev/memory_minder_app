import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

enum CoreLocalStorageKey {
  token("token"),
  refreshToken("refreshToken");

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
}
