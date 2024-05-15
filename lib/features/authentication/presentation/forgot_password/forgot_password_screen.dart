import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:memory_minder_app/common/widgets/app_scaffold.dart';
import 'package:memory_minder_app/constant/app_assets.dart';
import 'package:memory_minder_app/constant/app_text_styles.dart';
import 'package:memory_minder_app/features/authentication/presentation/forgot_password/forgot_password_controller.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_back_button.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_field.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_filled_button.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/utils/app_validators.dart';
import 'package:memory_minder_app/utils/utils.dart';

@RoutePage()
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormBuilderFieldState> emailKey = ref.watch(forgotPasswordControllerProvider);

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
          const SizedBox(height: 30),
          _forgotIcon(context),
          const SizedBox(height: 10),
          _title(context),
          const SizedBox(height: 10),
          _subTitle(context),
          const SizedBox(height: 15),
          _emailInput(emailKey, context),
          const SizedBox(height: 10),
          _suggestText(context),
          const SizedBox(height: 50),
          _resetButton(),
        ],
      ),
    );
  }

  AppFilledButton _resetButton() {
    return AppFilledButton(
      titleKey: LocaleKeys.forgotPasswordButtonResetPasswordTitle,
      onPressed: ref.watch(forgotPasswordControllerProvider.notifier).submit,
    );
  }

  RichText _suggestText(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "${I18nFunc.getLocaleMessage(LocaleKeys.forgotPasswordSuggest)} ",
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
            recognizer: TapGestureRecognizer()..onTap = () => debugPrint('Tap Here SignUp'),
          ),
        ],
      ),
    );
  }

  AppField _emailInput(GlobalKey<FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>> emailKey, BuildContext context) {
    return AppField(
      fieldKey: emailKey,
      labelText: I18nFunc.getLocaleMessage(LocaleKeys.commonEmailAddress),
      hintText: I18nFunc.getLocaleMessage(LocaleKeys.commonEmailHintText),
      prefixIcon: SvgPicture.asset(
        AppSvgIcons.email,
        fit: BoxFit.contain,
        colorFilter: ColorFilter.mode(
          Utils.getThemeColorScheme(context).onSurface,
          BlendMode.srcIn,
        ),
      ),
      formBuilderValidators: AppValidators.email,
    );
  }

  Text _subTitle(BuildContext context) {
    return Text(
      I18nFunc.getLocaleMessage(LocaleKeys.forgotPasswordSubTitle),
      style: Utils.getTextTheme(context).bodyMedium?.copyWith(
            color: Utils.getThemeColorScheme(context).onSurface,
          ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      I18nFunc.getLocaleMessage(LocaleKeys.forgotPasswordTitle),
      style: AppTextStyles.custom.bold20.copyWith(
        color: Utils.getThemeColorScheme(context).onSurface,
      ),
    );
  }

  SizedBox _forgotIcon(BuildContext context) {
    return SizedBox(
      child: SvgPicture.asset(
        AppSvgIcons.lock,
        width: 40,
        height: 40,
        colorFilter: ColorFilter.mode(
          Utils.getThemeColorScheme(context).onSurface,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
