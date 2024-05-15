import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/routes/route_path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_with_mail_form_controller.g.dart';

@riverpod
class LoginWithMailController extends _$LoginWithMailController {
  @override
  GlobalKey<FormBuilderState> build() => GlobalKey<FormBuilderState>();

  void submit(BuildContext context) {
    FormBuilderState? currentState = state.currentState;
    if (currentState == null) {
      return;
    } else {
      bool isValidate = currentState.validate();
      if (isValidate) {
        debugPrint("value: ${currentState.fields[I18nFunc.getLocaleMessage(LocaleKeys.commonEmailAddress)]?.value}");

        context.router.pushNamed(RoutePath.requestNotification);
      }
      return;
    }
  }
}
