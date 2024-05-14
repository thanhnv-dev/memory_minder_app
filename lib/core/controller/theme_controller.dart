import 'package:flutter/material.dart';
import 'package:memory_minder_app/core/data_sources/core_local_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

@Riverpod(keepAlive: true)
class ThemeController extends _$ThemeController {
  @override
  Future<ThemeMode> build() async {
    final coreLocalStorage = CoreLocalStorageDataSourceImpl();

    bool? isDarkTheme = await coreLocalStorage.getIsDarkTheme();

    if (isDarkTheme == null) {
      return ThemeMode.system;
    }

    return isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  }

  void changeState() {}
}
