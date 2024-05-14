import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';

class AppValidators {
  static final digitRegex = RegExp(r'\d');
  static final lowerCaseRegex = RegExp(r'[a-z]');
  static final upperCaseRegex = RegExp(r'[A-Z]');
  static final nonAlphanumericRegex = RegExp(r'[^a-zA-Z0-9]');

  static List<String? Function(String?)> email = [
    FormBuilderValidators.required(),
    FormBuilderValidators.email(),
  ];

  static List<String? Function(String?)> password = [
    FormBuilderValidators.required(),
    (val) {
      List<String> arg = [I18nFunc.getLocaleMessage(LocaleKeys.commonPassword)];
      if (val.toString().isEmpty) {
        return null;
      }
      if (!digitRegex.hasMatch(val.toString())) {
        return I18nFunc.getLocaleMessageWithPlural(LocaleKeys.validationPassWordMessages2, arg);
      }
      if (!lowerCaseRegex.hasMatch(val.toString())) {
        return I18nFunc.getLocaleMessageWithPlural(LocaleKeys.validationPassWordMessages3, arg);
      }
      if (!upperCaseRegex.hasMatch(val.toString())) {
        return I18nFunc.getLocaleMessageWithPlural(LocaleKeys.validationPassWordMessages4, arg);
      }
      if (!nonAlphanumericRegex.hasMatch(val.toString())) {
        return I18nFunc.getLocaleMessageWithPlural(LocaleKeys.validationPassWordMessages1, arg);
      }
      return null;
    },
    FormBuilderValidators.minLength(
      6,
      errorText: I18nFunc.getLocaleMessageWithPlural(LocaleKeys.validationPassWordMessages5, [I18nFunc.getLocaleMessage(LocaleKeys.commonPassword)]),
    ),
  ];

  static List<String? Function(String?)> confirmPassword = [
    FormBuilderValidators.required(),
    (val) {
      List<String> arg = [I18nFunc.getLocaleMessage(LocaleKeys.commonConfirmPassword)];

      if (val.toString().isEmpty) {
        return null;
      }
      if (!digitRegex.hasMatch(val.toString())) {
        return I18nFunc.getLocaleMessageWithPlural(LocaleKeys.validationPassWordMessages2, arg);
      }
      if (!lowerCaseRegex.hasMatch(val.toString())) {
        return I18nFunc.getLocaleMessageWithPlural(LocaleKeys.validationPassWordMessages3, arg);
      }
      if (!upperCaseRegex.hasMatch(val.toString())) {
        return I18nFunc.getLocaleMessageWithPlural(LocaleKeys.validationPassWordMessages4, arg);
      }
      if (!nonAlphanumericRegex.hasMatch(val.toString())) {
        return I18nFunc.getLocaleMessageWithPlural(LocaleKeys.validationPassWordMessages1, arg);
      }
      return null;
    },
    FormBuilderValidators.minLength(
      6,
      errorText:
          I18nFunc.getLocaleMessageWithPlural(LocaleKeys.validationPassWordMessages5, [I18nFunc.getLocaleMessage(LocaleKeys.commonConfirmPassword)]),
    ),
  ];
}
