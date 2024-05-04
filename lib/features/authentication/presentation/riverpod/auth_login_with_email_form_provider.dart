import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_login_with_email_form_provider.g.dart';

@riverpod
class AuthLoginWithEmailFormNotifier extends _$AuthLoginWithEmailFormNotifier {
  @override
  GlobalKey<FormBuilderState> build() => GlobalKey<FormBuilderState>();
}
