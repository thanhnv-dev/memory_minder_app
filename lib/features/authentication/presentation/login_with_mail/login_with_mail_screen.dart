import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_minder_app/common/widgets/app_scaffold.dart';
import 'package:memory_minder_app/constant/app_assets.dart';
import 'package:memory_minder_app/constant/app_colors.dart';
import 'package:memory_minder_app/constant/app_text_styles.dart';
import 'package:memory_minder_app/features/authentication/presentation/login_with_mail/login_with_mail_form.dart';
import 'package:memory_minder_app/features/authentication/presentation/login_with_mail/login_with_mail_form_controller.dart';
import 'package:memory_minder_app/features/authentication/presentation/login_with_mail/remember_me_controller.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_filled_button.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/check_button.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/other_login_method.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/terms_and_privacy.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/title_headline_large.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/routes/route_path.dart';
import 'package:memory_minder_app/utils/utils.dart';

@RoutePage()
class LoginWithMailScreen extends ConsumerStatefulWidget {
  const LoginWithMailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginWithMailScreenState();
}

class _LoginWithMailScreenState extends ConsumerState<LoginWithMailScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      activeUnFocusKeyboard: true,
      paddingTop: true,
      scroll: true,
      fullScreen: true,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _logoAndAppName(),
              _signUpTitle(),
              const LoginWithMailForm(),
              _rememberAndForgot(context),
              const SizedBox(height: 15),
              _loginButton(context),
            ],
          ),
          const TermsAndPrivacy(),
        ],
      ),
    );
  }

  TitleHeadlineLarge _signUpTitle() {
    return TitleHeadlineLarge(
      data: I18nFunc.getLocaleMessage(
        LocaleKeys.signUpWithEmailTitle,
      ),
      margin: const EdgeInsets.symmetric(vertical: 20),
    );
  }

  Row _rememberAndForgot(BuildContext context) {
    bool rememberMeState = ref.watch(rememberMeControllerProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CheckButton(
              state: rememberMeState,
              onPressed: () {
                ref.read(rememberMeControllerProvider.notifier).changeState();
              },
            ),
            Text(
              I18nFunc.getLocaleMessage(LocaleKeys.signInWithEmailRememberTitle),
              style: Utils.getTextTheme(context).bodyMedium?.copyWith(
                    color: Utils.getThemeColorScheme(context).onSurface,
                  ),
            )
          ],
        ),
        TextButton(
          onPressed: () {
            context.router.pushNamed(RoutePath.forgotPassword);
          },
          child: Text(
            I18nFunc.getLocaleMessage(LocaleKeys.signInWithEmailForgotTitle),
            style: Utils.getTextTheme(context).bodyMedium?.copyWith(
                  color: Utils.getThemeColorScheme(context).primary,
                ),
          ),
        ),
      ],
    );
  }

  Widget _logoAndAppName() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Image.asset(
            AppOtherIcons.logo,
            width: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                I18nFunc.getLocaleMessage(LocaleKeys.appNamePart1),
                style: AppTextStyles.custom.titleLogo.copyWith(color: AppColors.logoColor1),
              ),
              Text(
                " ${I18nFunc.getLocaleMessage(LocaleKeys.appNamePart2)}",
                style: AppTextStyles.custom.titleLogo.copyWith(color: AppColors.logoColor2),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Column(
      children: [
        AppFilledButton(
          titleKey: LocaleKeys.commonSignIn,
          onPressed: () => ref.read(loginWithMailControllerProvider.notifier).submit(context),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            I18nFunc.getLocaleMessage(LocaleKeys.commonOrText),
            style: Utils.getTextTheme(context).bodySmall?.copyWith(
                  color: Utils.getThemeColorScheme(context).onSurface,
                ),
          ),
        ),
        const OtherLoginMethod(),
        const SizedBox(height: 10),
        _suggestSignUp(context),
      ],
    );
  }

  RichText _suggestSignUp(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "${I18nFunc.getLocaleMessage(LocaleKeys.signInWithEmailSuggestTitle)} ",
        style: Utils.getTextTheme(context).bodyMedium?.copyWith(
              color: Utils.getThemeColorScheme(context).onSurface,
            ),
        children: [
          TextSpan(
            text: I18nFunc.getLocaleMessage(LocaleKeys.commonSignUp),
            style: Utils.getTextTheme(context).bodyMedium?.copyWith(
                  color: Utils.getThemeColorScheme(context).primary,
                  decoration: TextDecoration.underline,
                  decorationColor: Utils.getThemeColorScheme(context).primary,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.router.pushNamed(RoutePath.signUpWithEmail);
              },
          ),
        ],
      ),
    );
  }
}
