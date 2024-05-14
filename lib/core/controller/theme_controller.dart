import 'package:flutter/material.dart';
import 'package:memory_minder_app/core/data_sources/core_local_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeMode build() => ThemeMode.system;

  Future initTheme() async {
    final coreLocalStorage = CoreLocalStorageDataSourceImpl();
    bool? isDarkTheme = await coreLocalStorage.getIsDarkTheme();
    if (isDarkTheme == null) {
      state = ThemeMode.system;
    } else {
      state = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    }
  }

  void changeState() {}
}
