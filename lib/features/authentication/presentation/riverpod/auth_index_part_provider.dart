import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_index_part_provider.g.dart';

@riverpod
class AuthIndexPartNotifier extends _$AuthIndexPartNotifier {
  @override
  int build() => 0;

  void setState(int index) {
    state = index;
  }
}
