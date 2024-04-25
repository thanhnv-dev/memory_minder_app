import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_minder_app/constant/app_assets.dart';
import 'package:memory_minder_app/routes/route_path.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        context.router.replaceNamed(RoutePath.onboarding);
      },
    );
    return Scaffold(
      body: Image.asset(
        AppOtherImages.splash,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
