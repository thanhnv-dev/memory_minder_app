import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'agree_term_controller.g.dart';

@riverpod
class AgreeTermController extends _$AgreeTermController {
  @override
  bool build() => true;

  void changeState() {
    state = !state;
  }
}
