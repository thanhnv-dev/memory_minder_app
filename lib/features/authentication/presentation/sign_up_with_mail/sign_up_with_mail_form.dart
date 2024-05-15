import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:memory_minder_app/constant/app_assets.dart';
import 'package:memory_minder_app/features/authentication/presentation/sign_up_with_mail/sign_up_with_mail_form_controller.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_field.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/utils/app_validators.dart';
import 'package:memory_minder_app/utils/utils.dart';

class SignUpWithMailForm extends ConsumerStatefulWidget {
  const SignUpWithMailForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpWithMailFormState();
}

class _SignUpWithMailFormState extends ConsumerState<SignUpWithMailForm> {
  Object getPassword(GlobalKey<FormBuilderState> loginWithEmailFormKey) {
    FormBuilderState? currentState = loginWithEmailFormKey.currentState;
    if (currentState == null) {
      return '';
    } else {
      return currentState.fields[I18nFunc.getLocaleMessage(LocaleKeys.commonPassword)]?.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormBuilderState> loginWithEmailFormKey = ref.watch(signUpWithMailControllerProvider);
    return FormBuilder(
      key: loginWithEmailFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppField(
            formKey: loginWithEmailFormKey,
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
          ),
          const SizedBox(height: 20),
          AppField(
            formKey: loginWithEmailFormKey,
            obscureText: true,
            labelText: I18nFunc.getLocaleMessage(LocaleKeys.commonPassword),
            hintText: I18nFunc.getLocaleMessage(LocaleKeys.commonPasswordHintText),
            prefixIcon: SvgPicture.asset(
              AppSvgIcons.lock,
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                Utils.getThemeColorScheme(context).onSurface,
                BlendMode.srcIn,
              ),
            ),
            formBuilderValidators: AppValidators.password,
          ),
          const SizedBox(height: 20),
          AppField(
            formKey: loginWithEmailFormKey,
            obscureText: true,
            labelText: I18nFunc.getLocaleMessage(LocaleKeys.commonConfirmPassword),
            hintText: I18nFunc.getLocaleMessage(LocaleKeys.commonPasswordHintText),
            prefixIcon: SvgPicture.asset(
              AppSvgIcons.lock,
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                Utils.getThemeColorScheme(context).onSurface,
                BlendMode.srcIn,
              ),
            ),
            formBuilderValidators: [
              ...AppValidators.confirmPassword,
              (val) {
                if (val != getPassword(loginWithEmailFormKey)) return I18nFunc.getLocaleMessage(LocaleKeys.validationPassWordMessages6);
                return null;
              },
            ],
          ),
        ],
      ),
    );
  }
}
