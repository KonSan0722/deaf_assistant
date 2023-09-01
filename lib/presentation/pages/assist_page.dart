import 'package:cool_alert/cool_alert.dart';
import 'package:deaf_assist/application/state/deaf_assist_provider.dart';
import 'package:deaf_assist/presentation/theme/color.dart';
import 'package:deaf_assist/presentation/widget/add_text_button.dart';
import 'package:deaf_assist/presentation/widget/bookmark.dart';
import 'package:deaf_assist/presentation/widget/deaf_assist_button.dart';
import 'package:deaf_assist/presentation/widget/deaf_textForm.dart';
import 'package:deaf_assist/presentation/widget/explanation_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:status_alert/status_alert.dart';

class AssistPage extends HookConsumerWidget {
  const AssistPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editController = useTextEditingController();
    final modelsProvider = ref.watch(modelsNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: DeafAssistantColors.backGroundColor,
        elevation: 0,
        centerTitle: true,
        title: AddTextButton(controller: editController),
        leading: IconButton(
          icon: const Icon(
            Icons.menu_book,
            size: 30,
          ),
          onPressed: () {
            CoolAlert.show(
              lottieAsset: "lib/images/question.json",
              backgroundColor: DeafAssistantColors.backGroundColor,
              confirmBtnColor: DeafAssistantColors.backGroundColor,
              confirmBtnText: "了解",
              context: context,
              title: "使い方",
              type: CoolAlertType.info,
              text:
                  '''スマートフォンのマイク入力を許可し、画面下部にあるマイクボタンを長押ししながらスマートフォンに話しかけてください。\n\n表示された文字はピンチイン、ピンチアウトで文字の拡大、縮小をすることができます。\n\nいつも使う文言はテキストがフィールド上に文字がある状態で画面上部中央のアイコンをタップすることで保存することができます。\n\n保存した定型文は画面上部右のサイドバーメニューをタップすることで呼び出すことができます。''',
            );
          },
        ),
      ),
      endDrawer: BookMark(
        controller: editController,
      ),
      backgroundColor: const Color.fromARGB(222, 255, 247, 177),
      body: SingleChildScrollView(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              DeafTextForm(
                controller: editController,
              ),
              DeafAssistButton(controller: editController),
            ],
          ),
        ),
      ),
    );
  }
}
