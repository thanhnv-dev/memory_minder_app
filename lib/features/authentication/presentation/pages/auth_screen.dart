import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_minder_app/common/widgets/app_scaffold.dart';
import 'package:memory_minder_app/features/authentication/presentation/riverpod/auth_active_part_login_with_mail_provider.dart';
import 'package:memory_minder_app/features/authentication/presentation/riverpod/auth_index_part_provider.dart';
import 'package:memory_minder_app/features/authentication/presentation/riverpod/auth_login_with_email_input_email_provider.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/choose_login_method_layer.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/image_background_layer.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/login_with_email_layer.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/onboarding_layer.dart';
import 'package:memory_minder_app/utils/utils.dart';

@RoutePage()
class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> with TickerProviderStateMixin {
  final PageController _pageViewController = PageController();

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
    int authIndexPart = ref.watch(authIndexPartNotifierProvider);

    GlobalKey<FormBuilderState> emailInputKey = ref.read(authLoginWithEmailInputEmailNotifierProvider.notifier).getKey;

    bool activePartLoginWithEmail = ref.watch(authActivePartLoginWithMailNotifierProvider);

    bool goToSelectLoginMethod = authIndexPart == 3;

    Duration duration300 = const Duration(milliseconds: 300);

    double getHeightWithPersent(double percent) {
      return MediaQuery.of(context).size.height /
          100 *
          (activePartLoginWithEmail
              ? percent
              : goToSelectLoginMethod
                  ? 50
                  : percent);
    }

    void nextImageBackground(int index) {
      ref.read(authIndexPartNotifierProvider.notifier).setState(index);
    }

    void setAuthActivePartLoginWithMail() {
      ref.read(authActivePartLoginWithMailNotifierProvider.notifier).changeState();
    }

    void onboardingNextPart() {
      if (authIndexPart < 3) {
        _pageViewController.animateToPage(
          authIndexPart + 1,
          duration: duration300,
          curve: Curves.linear,
        );
      }
    }

    Widget getLayer() {
      if (activePartLoginWithEmail) {
        return LoginWithEmailLayer(
          emailInputKey: emailInputKey,
          onPressSignIn: () {},
          onChangeEmail: ref.read(authLoginWithEmailInputEmailNotifierProvider.notifier).onChanged,
        );
      }
      if (goToSelectLoginMethod) {
        return ChooseLoginMethodLayer(
          pageViewController: _pageViewController,
          onPressContinueWithEmail: setAuthActivePartLoginWithMail,
        );
      }
      return OnboardingLayer(
        authIndexPart: authIndexPart,
        pageViewController: _pageViewController,
        nextPart: onboardingNextPart,
      );
    }

    return AppScaffold(
      activeUnFocusKeyboard: true,
      child: Stack(
        children: [
          ImageBackgroundLayer(
            pageViewController: _pageViewController,
            nextImageBackground: nextImageBackground,
          ),
          Column(
            children: [
              AnimatedContainer(
                height: activePartLoginWithEmail ? getHeightWithPersent(10) : getHeightWithPersent(60),
                duration: duration300,
                curve: Curves.linear,
              ),
              AnimatedContainer(
                height: activePartLoginWithEmail ? getHeightWithPersent(90) : getHeightWithPersent(40),
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
