import 'package:flutter/material.dart';

class Utils {
  static ColorScheme getThemeColorScheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  static TextTheme getTextTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }
}
