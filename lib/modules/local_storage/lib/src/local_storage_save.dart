import 'dart:convert';
import 'package:local_storage/src/local_storage_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveDataLocalStorage {
  Future<void> onboadingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(LocalStorageKey.onboardingStatus.toString(), true);
  }

  Future<void> rememberLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(LocalStorageKey.rememberLogin.toString(), true);
  }

  Future<void> darkMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(LocalStorageKey.darkMode.toString(), value);
  }

  Future<void> defaultLanguage(String defaultLanguage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(LocalStorageKey.defaultLanguage.toString(),
        jsonEncode(defaultLanguage));
  }

  Future<void> token(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(LocalStorageKey.token.toString(), jsonEncode(token));
  }

  Future<void> refreshToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        LocalStorageKey.refreshToken.toString(), jsonEncode(token));
  }

  Future<void> dataUser(String? token, String? refreshToken,
      [String? idUser]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(LocalStorageKey.token.toString(), jsonEncode(token));
    await prefs.setString(
        LocalStorageKey.refreshToken.toString(), jsonEncode(refreshToken));
    if (idUser != null) {
      await prefs.setString(
          LocalStorageKey.idUser.toString(), jsonEncode(idUser));
    }
  }
}
