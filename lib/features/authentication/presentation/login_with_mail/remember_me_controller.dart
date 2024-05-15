import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remember_me_controller.g.dart';

@riverpod
class RememberMeController extends _$RememberMeController {
  @override
  bool build() => true;

  void changeState() {
    state = !state;
  }
}
