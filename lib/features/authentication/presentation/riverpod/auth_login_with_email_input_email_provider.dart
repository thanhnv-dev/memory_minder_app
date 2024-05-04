import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_login_with_email_input_email_provider.g.dart';

@riverpod
class AuthLoginWithEmailInputEmailNotifier extends _$AuthLoginWithEmailInputEmailNotifier {
  final GlobalKey<FormBuilderState> _emailInputKey = GlobalKey<FormBuilderState>();

  @override
  String? build() => null;

  GlobalKey<FormBuilderState> get getKey => _emailInputKey;

  void onChanged(String? value) {
    print("value: ${_emailInputKey.currentState?.isValid}");
  }
}
