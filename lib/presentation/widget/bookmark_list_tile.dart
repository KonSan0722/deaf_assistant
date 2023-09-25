import 'package:deaf_assist/application/state/deaf_assist_provider.dart';
import 'package:deaf_assist/presentation/widget/bookmark_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookMarkListTile extends ConsumerWidget {
  const BookMarkListTile(
      {super.key,
      required this.model,
      required this.number,
      required this.controller});
  final TextEditingController controller;
  final BookmarkModel model;
  final int number;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelState = ref.watch(modelsNotifierProvider);
    final num = number + 1;
    return ListTile(
      title: Text(
        "$num:  ${model.text}",
        style: TextStyle(color: Colors.white),
      ),
      leading: const Icon(
        Icons.comment,
        color: Colors.white,
      ),
      onTap: () {
        controller.text = model.text;
        Navigator.pop(context);
      },
    );
  }
}
