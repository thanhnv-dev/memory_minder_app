import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_minder_app/config/app_theme.dart';
import 'package:memory_minder_app/core/controller/theme_controller.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/i18n/i18n.dart';
import 'package:memory_minder_app/routes/route_config.dart';
import 'package:memory_minder_app/utils/utils.dart';

Future main() async {
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
    ThemeMode? themeMode = ref.watch(themeControllerProvider);

    ColorScheme colorSchemeInit = Utils.getThemeColorSchemeInit(themeMode);

    EasyLoading.instance
      ..userInteractions = false
      ..maskType = EasyLoadingMaskType.none
      ..loadingStyle = EasyLoadingStyle.custom
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..indicatorColor = Colors.white
      ..textColor = colorSchemeInit.onSecondaryContainer
      ..backgroundColor = colorSchemeInit.secondaryContainer
      ..progressColor = Colors.white;

    return MaterialApp.router(
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      themeMode: themeMode,
      localizationsDelegates: I18nFunc.getLocalizationDelegates(context),
      supportedLocales: I18nFunc.getSupportedLocales(context),
      locale: I18nFunc.getLocale(context),
      routerConfig: _appRouter.config(),
      builder: EasyLoading.init(),
    );
  }
}
