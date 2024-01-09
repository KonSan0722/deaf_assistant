import 'package:deaf_assist/presentation/widget/bookmark_model.dart';
import 'package:deaf_assist/presentation/widget/kv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'deaf_assist_provider.g.dart';

@riverpod
class ModelsNotifier extends _$ModelsNotifier {
  @override
  List<BookmarkModel> build() {
    return [];
  }

  void input(value) {
    final oldState = state;
    final newState = List.of(oldState);
    newState.add(value);
    state = newState;
    saveBookMark(newState);
  }

  void remove(value) {
    final oldState = state;
    final newState = List.of(oldState);
    newState.removeAt(value);
    state = newState;
  }
}
