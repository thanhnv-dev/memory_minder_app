import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_minder_app/common/widgets/app_scaffold.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/choose_login_method_layer.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/image_background_layer.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/onboarding_layer.dart';
import 'package:memory_minder_app/routes/route_path.dart';
import 'package:memory_minder_app/utils/utils.dart';

@RoutePage()
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> with TickerProviderStateMixin {
  final PageController _pageViewController = PageController();
  int indexPart = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool goToSelectLoginMethod = indexPart == 3;

    Duration duration300 = const Duration(milliseconds: 300);

    double getHeightWithPersent(double percent) {
      return MediaQuery.of(context).size.height / 100 * (goToSelectLoginMethod ? 50 : percent);
    }

    void nextImageBackground(int index) {
      setState(() {
        indexPart = index;
      });
    }

    void onPressContinueWithEmail() {
      context.router.pushNamed(RoutePath.loginWithEmail);
    }

    void onboardingNextPart() {
      if (indexPart < 3) {
        _pageViewController.animateToPage(
          indexPart + 1,
          duration: duration300,
          curve: Curves.linear,
        );
      }
    }

    Widget getLayer() {
      return goToSelectLoginMethod
          ? ChooseLoginMethodLayer(
              pageViewController: _pageViewController,
              onPressContinueWithEmail: onPressContinueWithEmail,
            )
          : OnboardingLayer(
              authIndexPart: indexPart,
              pageViewController: _pageViewController,
              nextPart: onboardingNextPart,
            );
    }

    return AppScaffold(
      activeUnFocusKeyboard: true,
      paddingTop: false,
      child: Stack(
        children: [
          ImageBackgroundLayer(
            pageViewController: _pageViewController,
            nextImageBackground: nextImageBackground,
          ),
          Column(
            children: [
              AnimatedContainer(
                height: getHeightWithPersent(60),
                duration: duration300,
                curve: Curves.linear,
              ),
              AnimatedContainer(
                height: getHeightWithPersent(40),
                duration: duration300,
                decoration: BoxDecoration(
                  color: Utils.getThemeColorScheme(context).surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(13),
                    topRight: Radius.circular(13),
                  ),
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Utils.getThemeColorScheme(context).outline,
                    ),
                  ),
                ),
                curve: Curves.linear,
                child: getLayer(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
