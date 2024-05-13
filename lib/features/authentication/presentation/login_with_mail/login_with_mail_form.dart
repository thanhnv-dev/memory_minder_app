import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:memory_minder_app/constant/app_assets.dart';
import 'package:memory_minder_app/features/authentication/presentation/login_with_mail/login_with_mail_form_controller.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_field.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/title_headline_large.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/utils/app_validators.dart';

class LoginWithMailForm extends ConsumerStatefulWidget {
  const LoginWithMailForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginWithMailFormState();
}

class _LoginWithMailFormState extends ConsumerState<LoginWithMailForm> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormBuilderState> loginWithEmailFormKey = ref.watch(loginWithMailControllerProvider);
    return FormBuilder(
      key: loginWithEmailFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          TitleHeadlineLarge(
            data: I18nFunc.getLocaleMessage(
              LocaleKeys.signUpWithEmailTitle,
            ),
            margin: const EdgeInsets.symmetric(vertical: 20),
          ),
          AppField(
            labelText: I18nFunc.getLocaleMessage(LocaleKeys.commonEmailAddress),
            hintText: I18nFunc.getLocaleMessage(LocaleKeys.commonEmailHintText),
            prefixIcon: SvgPicture.asset(
              AppSvgIcons.email,
              fit: BoxFit.contain,
            ),
            formBuilderValidators: AppValidators.email,
          ),
          const SizedBox(height: 20),
          AppField(
            obscureText: true,
            labelText: I18nFunc.getLocaleMessage(LocaleKeys.commonPassword),
            hintText: I18nFunc.getLocaleMessage(LocaleKeys.commonPasswordHintText),
            prefixIcon: SvgPicture.asset(
              AppSvgIcons.lock,
              fit: BoxFit.contain,
            ),
            formBuilderValidators: AppValidators.password,
          ),
        ],
      ),
    );
  }
}
