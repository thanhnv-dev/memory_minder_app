import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_controller.g.dart';

@riverpod
class ForgotPasswordController extends _$ForgotPasswordController {
  @override
  GlobalKey<FormBuilderFieldState> build() => GlobalKey<FormBuilderFieldState>();

  void submit() {
    FormBuilderFieldState? currentState = state.currentState;
    if (currentState == null) {
      return;
    } else {
      bool isValidate = currentState.validate();
      if (isValidate) {
        debugPrint("value: ${currentState.value}");
      }
      return;
    }
  }
}
