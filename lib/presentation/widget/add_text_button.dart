import 'package:deaf_assist/application/state/deaf_assist_provider.dart';
import 'package:deaf_assist/presentation/widget/bookmark_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:status_alert/status_alert.dart';

class AddTextButton extends HookConsumerWidget {
  const AddTextButton({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var modelsProvider = ref.watch(modelsNotifierProvider);

    void addBookmark(String text) {
      final notifier = ref.read(modelsNotifierProvider.notifier);
      notifier.input(BookmarkModel(text));
    }

    return IconButton(
      icon: const Icon(
        Icons.bookmark_add,
        size: 30,
      ),
      onPressed: () {
        addBookmark(controller.text);
        StatusAlert.show(context,
            duration: const Duration(seconds: 2),
            title: '保存完了',
            configuration: const IconConfiguration(icon: Icons.done),
            maxWidth: 260);
      },
    );
  }
}
