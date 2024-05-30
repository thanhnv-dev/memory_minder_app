import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:memory_minder_app/features/authentication/data/repositories/auth_respository_impl.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/routes/route_path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_with_mail_form_controller.g.dart';

@riverpod
class LoginWithMailController extends _$LoginWithMailController {
  @override
  GlobalKey<FormBuilderState> build() => GlobalKey<FormBuilderState>();

  Future<void> submit(BuildContext context) async {
    FormBuilderState? currentState = state.currentState;

    if (currentState == null) return;

    bool isValidate = currentState.validate();
    if (isValidate) {
      EasyLoading.show();
      String email = currentState.fields[I18nFunc.getLocaleMessage(LocaleKeys.commonEmailAddress)]?.value;
      String password = currentState.fields[I18nFunc.getLocaleMessage(LocaleKeys.commonPassword)]?.value;

      final bytes = utf8.encode(password);
      final cryptoPassword = sha224.convert(bytes).toString();

      await ref.read(authRepositoryProvider).signUp(email, cryptoPassword).then(
            (res) => {
              res.fold(
                (l) => {
                  EasyLoading.showToast(l.error),
                },
                (r) => {
                  if (context.mounted) {context.router.pushNamed(RoutePath.requestNotification)}
                },
              )
            },
          );

      EasyLoading.dismiss();
    }
  }
}
