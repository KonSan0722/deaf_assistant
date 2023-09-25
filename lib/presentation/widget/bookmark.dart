import 'package:deaf_assist/application/state/deaf_assist_provider.dart';
import 'package:deaf_assist/presentation/theme/color.dart';
import 'package:deaf_assist/presentation/widget/bookmark_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bookmark_model.dart';

class BookMark extends HookConsumerWidget {
  const BookMark({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var modelState = ref.watch(modelsNotifierProvider);
    final list = ListView.builder(
        itemCount: modelState.length,
        itemBuilder: (context, index) {
          return Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    final notifier = ref.read(modelsNotifierProvider.notifier);
                    notifier.remove(index);
                  },
                  backgroundColor: DeafAssistantColors.deleteButtonColor,
                  foregroundColor:
                      DeafAssistantColors.deleteButton_foregroundColor,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: BookMarkListTile(
              model: modelState[index],
              number: index,
              controller: controller,
            ),
          );
        });
    final con = Center(
      child: SizedBox(child: list),
    );
    return Drawer(
      backgroundColor: Colors.transparent,
      width: 200,
      child: con,
    );
  }
}
