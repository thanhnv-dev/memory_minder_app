// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:memory_minder_app/features/authentication/presentation/forgot_password/forgot_password_screen.dart'
    as _i1;
import 'package:memory_minder_app/features/authentication/presentation/login_with_mail/login_with_mail_screen.dart'
    as _i2;
import 'package:memory_minder_app/features/authentication/presentation/notification/request_notification_screen.dart'
    as _i4;
import 'package:memory_minder_app/features/authentication/presentation/onboarding/onboarding_screen.dart'
    as _i3;
import 'package:memory_minder_app/features/authentication/presentation/sign_up_with_mail/sign_up_with_screen.dart'
    as _i5;
import 'package:memory_minder_app/features/authentication/presentation/splash/splash_screen.dart'
    as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    ForgotPasswordRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ForgotPasswordScreen(),
      );
    },
    LoginWithMailRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginWithMailScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.OnboardingScreen(),
      );
    },
    RequestNotificationRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RequestNotificationScreen(),
      );
    },
    SignUpWithMailRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUpWithMailScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i7.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginWithMailScreen]
class LoginWithMailRoute extends _i7.PageRouteInfo<void> {
  const LoginWithMailRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginWithMailRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginWithMailRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.OnboardingScreen]
class OnboardingRoute extends _i7.PageRouteInfo<void> {
  const OnboardingRoute({List<_i7.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RequestNotificationScreen]
class RequestNotificationRoute extends _i7.PageRouteInfo<void> {
  const RequestNotificationRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RequestNotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RequestNotificationRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SignUpWithMailScreen]
class SignUpWithMailRoute extends _i7.PageRouteInfo<void> {
  const SignUpWithMailRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SignUpWithMailRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpWithMailRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
