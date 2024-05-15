import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_with_mail_form_controller.g.dart';

@riverpod
class SignUpWithMailController extends _$SignUpWithMailController {
  @override
  GlobalKey<FormBuilderState> build() => GlobalKey<FormBuilderState>();

  void submit() {
    FormBuilderState? currentState = state.currentState;
    if (currentState == null) {
      return;
    } else {
      bool isValidate = currentState.validate();
      if (isValidate) {
        debugPrint("value: ${currentState.fields[I18nFunc.getLocaleMessage(LocaleKeys.commonEmailAddress)]?.value}");
      }
      return;
    }
  }
}
