import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:memory_minder_app/constant/app_assets.dart';
import 'package:memory_minder_app/constant/app_colors.dart';
import 'package:memory_minder_app/constant/app_text_styles.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_filled_button.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/other_login_method.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/terms_and_privacy.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/utils/utils.dart';

class LoginWithEmailLayer extends StatefulWidget {
  const LoginWithEmailLayer({
    super.key,
    required this.onPressSignIn,
    required this.emailInputKey,
    required this.onChangeEmail,
  });

  final void Function() onPressSignIn;
  final void Function(String? value) onChangeEmail;
  final GlobalKey<FormBuilderState> emailInputKey;

  @override
  LoginWithEmailLayerState createState() => LoginWithEmailLayerState();
}

class LoginWithEmailLayerState extends State<LoginWithEmailLayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _logoAndAppName(),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    I18nFunc.getLocaleMessage(
                      LocaleKeys.signUpWithEmailTitle,
                    ),
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  const SizedBox(height: 14),
                  FormBuilderTextField(
                    onChanged: widget.onChangeEmail,
                    key: widget.emailInputKey,
                    name: I18nFunc.getLocaleMessage(LocaleKeys.commonEmailAddress),
                    textAlignVertical: TextAlignVertical.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      labelText: I18nFunc.getLocaleMessage(LocaleKeys.commonEmailAddress),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(width: 3),
                      ),
                      hintText: I18nFunc.getLocaleMessage(LocaleKeys.commonEmailHintText),
                      // helperText: 'Helper Text',
                      // counterText: '0 characters',
                      prefixIcon: Container(
                        width: 22,
                        height: 22,
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          AppSvgIcons.email,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          _loginAction(context),
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

  Expanded _loginAction(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppFilledButton(
            titleKey: LocaleKeys.commonSignIn,
            onPressed: widget.onPressSignIn,
          ),
          Text(
            I18nFunc.getLocaleMessage(LocaleKeys.commonOrText),
            style: Utils.getTextTheme(context).bodySmall?.copyWith(
                  color: Utils.getThemeColorScheme(context).onSurface,
                ),
          ),
          const OtherLoginMethod(),
        ],
      ),
    );
  }
}
