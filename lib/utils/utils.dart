import 'package:flutter/material.dart';
import 'package:memory_minder_app/config/app_theme.dart';

class Utils {
  static ColorScheme getThemeColorScheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  static TextTheme getTextTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  static ColorScheme getThemeColorSchemeInit(ThemeMode? themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return appDarkTheme.colorScheme;
      case ThemeMode.light:
        return appLightTheme.colorScheme;
      default:
        return appLightTheme.colorScheme;
    }
  }
}
