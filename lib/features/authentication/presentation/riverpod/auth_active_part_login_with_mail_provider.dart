import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_active_part_login_with_mail_provider.g.dart';

@riverpod
class AuthActivePartLoginWithMailNotifier extends _$AuthActivePartLoginWithMailNotifier {
  @override
  bool build() => false;

  void changeState() {
    state = !state;
  }
}
