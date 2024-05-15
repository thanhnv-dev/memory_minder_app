import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_minder_app/core/controller/theme_controller.dart';
import 'package:memory_minder_app/routes/route_path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_controller.g.dart';

@riverpod
class SplashController extends _$SplashController {
  @override
  build() {
    return null;
  }

  void init(BuildContext context) {
    ref.read(themeControllerProvider.notifier).initTheme();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        context.router.replaceNamed(RoutePath.onboarding);
      },
    );
  }
}
