import 'package:deaf_assist/presentation/widget/bookmark_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'deaf_assist_provider.g.dart';

@riverpod
class ModelsNotifier extends _$ModelsNotifier {
  @override
  List build() {
    return [];
  }

  void input(value) {
    state.add(value);
  }

  void remove(value) {
    state.removeAt(value);
  }
}
