import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:memory_minder_app/common/widgets/app_scaffold.dart';
import 'package:memory_minder_app/constant/app_assets.dart';
import 'package:memory_minder_app/constant/app_colors.dart';
import 'package:memory_minder_app/constant/app_text_styles.dart';
import 'package:memory_minder_app/features/authentication/presentation/login_with_mail/login_with_mail_form.dart';
import 'package:memory_minder_app/features/authentication/presentation/login_with_mail/login_with_mail_form_controller.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_filled_button.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/other_login_method.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/terms_and_privacy.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
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
            children: [
              _logoAndAppName(),
              const LoginWithMailForm(),
              _loginButton(context),
            ],
          ),
          const TermsAndPrivacy(),
        ],
      ),
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppFilledButton(
          titleKey: LocaleKeys.commonSignIn,
          onPressed: ref.read(loginWithMailControllerProvider.notifier).submit,
        ),
        Text(
          I18nFunc.getLocaleMessage(LocaleKeys.commonOrText),
          style: Utils.getTextTheme(context).bodySmall?.copyWith(
                color: Utils.getThemeColorScheme(context).onSurface,
              ),
        ),
        const OtherLoginMethod(),
      ],
    );
  }
}
