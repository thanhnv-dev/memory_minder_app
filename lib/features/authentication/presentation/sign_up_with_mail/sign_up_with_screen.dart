import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_minder_app/common/widgets/app_scaffold.dart';
import 'package:memory_minder_app/features/authentication/presentation/sign_up_with_mail/agree_term_controller.dart';
import 'package:memory_minder_app/features/authentication/presentation/sign_up_with_mail/sign_up_with_mail_form.dart';
import 'package:memory_minder_app/features/authentication/presentation/sign_up_with_mail/sign_up_with_mail_form_controller.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_back_button.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_filled_button.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/check_button.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/other_login_method.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/title_headline_large.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/routes/route_path.dart';
import 'package:memory_minder_app/utils/utils.dart';

@RoutePage()
class SignUpWithMailScreen extends ConsumerStatefulWidget {
  const SignUpWithMailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpWithMailScreenState();
}

class _SignUpWithMailScreenState extends ConsumerState<SignUpWithMailScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      activeUnFocusKeyboard: true,
      fullScreen: true,
      paddingTop: true,
      scroll: true,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBackButton(),
          _signUpTitle(),
          const SignUpWithMailForm(),
          _agreeTerm(context),
          const SizedBox(height: 15),
          _signUpButton(),
          _orText(context),
          const OtherLoginMethod(),
          const SizedBox(height: 10),
          _suggestLogin(context),
        ],
      ),
    );
  }

  Container _orText(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            I18nFunc.getLocaleMessage(LocaleKeys.commonOrText),
            style: Utils.getTextTheme(context).bodySmall?.copyWith(
                  color: Utils.getThemeColorScheme(context).onSurface,
                ),
          ),
        ],
      ),
    );
  }

  AppFilledButton _signUpButton() {
    return AppFilledButton(
      titleKey: LocaleKeys.commonSignUp,
      onPressed: ref.read(signUpWithMailControllerProvider.notifier).submit,
    );
  }

  Widget _suggestLogin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "${I18nFunc.getLocaleMessage(LocaleKeys.signUpWithEmailSuggestTitle)} ",
            style: Utils.getTextTheme(context).bodyMedium?.copyWith(
                  color: Utils.getThemeColorScheme(context).onSurface,
                ),
            children: [
              TextSpan(
                text: I18nFunc.getLocaleMessage(LocaleKeys.commonSignIn),
                style: Utils.getTextTheme(context).bodyMedium?.copyWith(
                      color: Utils.getThemeColorScheme(context).primary,
                      decoration: TextDecoration.underline,
                      decorationColor: Utils.getThemeColorScheme(context).primary,
                    ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.router.pushNamed(RoutePath.loginWithEmail);
                  },
              ),
            ],
          ),
        ),
      ],
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

  Row _agreeTerm(BuildContext context) {
    bool agreeTermState = ref.watch(agreeTermControllerProvider);

    return Row(
      children: [
        CheckButton(
          onPressed: ref.read(agreeTermControllerProvider.notifier).changeState,
          state: agreeTermState,
        ),
        RichText(
          maxLines: 2,
          text: TextSpan(
            text: "${I18nFunc.getLocaleMessage(LocaleKeys.signInWithEmailAgreeTermsPartStart)} ",
            style: Utils.getTextTheme(context).bodySmall?.copyWith(
                  color: Utils.getThemeColorScheme(context).onSurface,
                ),
            children: [
              TextSpan(
                text: I18nFunc.getLocaleMessage(LocaleKeys.commonTerms),
                style: Utils.getTextTheme(context).bodySmall?.copyWith(
                      color: Utils.getThemeColorScheme(context).primary,
                      decoration: TextDecoration.underline,
                      decorationColor: Utils.getThemeColorScheme(context).primary,
                    ),
                recognizer: TapGestureRecognizer()..onTap = () => debugPrint('Tap Here Terms'),
              ),
              TextSpan(
                text: " ${I18nFunc.getLocaleMessage(LocaleKeys.commonAnd)} ",
                style: Utils.getTextTheme(context).bodySmall?.copyWith(
                      color: Utils.getThemeColorScheme(context).onSurface,
                    ),
              ),
              TextSpan(
                text: "${I18nFunc.getLocaleMessage(LocaleKeys.commonPrivacy)}.",
                style: Utils.getTextTheme(context).bodySmall?.copyWith(
                      color: Utils.getThemeColorScheme(context).primary,
                      decoration: TextDecoration.underline,
                      decorationColor: Utils.getThemeColorScheme(context).primary,
                    ),
                recognizer: TapGestureRecognizer()..onTap = () => debugPrint('Tap Here Privacy'),
              )
            ],
          ),
        )
      ],
    );
  }
}
