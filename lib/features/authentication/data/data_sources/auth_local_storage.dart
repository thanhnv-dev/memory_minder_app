import 'package:shared_preferences/shared_preferences.dart';

enum AuthLocalStorageKey {
  token("token"),
  refreshToken("refreshToken"),
  onboardingStatus("onboardingStatus"),
  rememberLogin("rememberLogin"),
  idUser("idUser"),
  defaultLanguage("defaultLanguage"),
  darkMode("darkMode");

  final String name;
  const AuthLocalStorageKey(this.name);

  String get displayName {
    return name;
  }
}

abstract class AuthLocalStorageDataSource {
  Future<bool> getOnboadingStatus();
  Future<void> setOnboadingStatus();
  Future<void> removeOnboadingStatus();
}

class AuthLocalStorageDataSourceImpl implements AuthLocalStorageDataSource {
  @override
  Future<bool> getOnboadingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final onboadingStatusEncoded =
          prefs.getBool(AuthLocalStorageKey.onboardingStatus.name);
      if (onboadingStatusEncoded == null) {
        return false;
      } else {
        return onboadingStatusEncoded;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> setOnboadingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AuthLocalStorageKey.onboardingStatus.name, true);
  }

  @override
  Future<void> removeOnboadingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(AuthLocalStorageKey.onboardingStatus.name);
  }
}
