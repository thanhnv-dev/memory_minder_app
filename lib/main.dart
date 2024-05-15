import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_minder_app/config/app_theme.dart';
import 'package:memory_minder_app/core/controller/theme_controller.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/i18n/i18n.dart';
import 'package:memory_minder_app/routes/route_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    await I18n.init(
      child: const ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      themeMode: ref.watch(themeControllerProvider),
      localizationsDelegates: I18nFunc.getLocalizationDelegates(context),
      supportedLocales: I18nFunc.getSupportedLocales(context),
      locale: I18nFunc.getLocale(context),
      routerConfig: _appRouter.config(),
    );
  }
}
