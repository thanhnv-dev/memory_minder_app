import 'package:auto_route/auto_route.dart';
import 'package:memory_minder_app/routes/route_config.gr.dart';
import 'package:memory_minder_app/routes/route_path.dart';

// part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: SplashRoute.page,
          path: RoutePath.splash,
        ),
        AutoRoute(
          page: OnboardingRoute.page,
          path: RoutePath.onboarding,
        ),
        AutoRoute(
          page: LoginWithMailRoute.page,
          path: RoutePath.loginWithEmail,
        ),
      ];
}
