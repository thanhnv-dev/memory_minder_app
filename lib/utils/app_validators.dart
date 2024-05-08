import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';

class AppValidators {
  static List<String? Function(String?)> email = [
    FormBuilderValidators.required(),
    FormBuilderValidators.email(),
  ];
  static List<String? Function(String?)> password = [
    FormBuilderValidators.required(),
    (val) {
      final digitRegex = RegExp(r'\d');
      final lowerCaseRegex = RegExp(r'[a-z]');
      final upperCaseRegex = RegExp(r'[A-Z]');
      final nonAlphanumericRegex = RegExp(r'[^a-zA-Z0-9]');
      if (val.toString().isEmpty) {
        return null;
      }
      if (!digitRegex.hasMatch(val.toString())) {
        return I18nFunc.getLocaleMessage(LocaleKeys.validationPassWordMessages2);
      }
      if (!lowerCaseRegex.hasMatch(val.toString())) {
        return I18nFunc.getLocaleMessage(LocaleKeys.validationPassWordMessages3);
      }
      if (!upperCaseRegex.hasMatch(val.toString())) {
        return I18nFunc.getLocaleMessage(LocaleKeys.validationPassWordMessages4);
      }
      if (!nonAlphanumericRegex.hasMatch(val.toString())) {
        return I18nFunc.getLocaleMessage(LocaleKeys.validationPassWordMessages1);
      }
      return null;
    },
    FormBuilderValidators.minLength(
      6,
      errorText: I18nFunc.getLocaleMessage(LocaleKeys.validationPassWordMessages5),
    ),
  ];
}
