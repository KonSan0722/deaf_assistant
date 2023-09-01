import 'package:avatar_glow/avatar_glow.dart';
import 'package:deaf_assist/application/state/deaf_assist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';

class DeafAssistButton extends HookConsumerWidget {
  DeafAssistButton({super.key, required this.controller});
  SpeechToText speechToText = SpeechToText();
  TextEditingController controller = useTextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isListening = useState(false);
    var text = useState("");
    return AvatarGlow(
        endRadius: 75.0,
        animate: isListening.value,
        duration: const Duration(milliseconds: 2000),
        glowColor: Colors.black,
        repeatPauseDuration: const Duration(milliseconds: 100),
        showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async {
            if (!isListening.value) {
              var available = await speechToText.initialize();
              if (available) {
                isListening.value = true;
                speechToText.listen(onResult: (result) {
                  text.value = result.recognizedWords;
                  controller.text += text.value;
                });
              }
            }
          },
          onTapUp: (details) {
            isListening.value = false;
            speechToText.stop();
          },
          child: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            radius: 35,
            child: Icon(
              isListening.value ? Icons.mic : Icons.mic_none,
              color: Colors.black,
            ),
          ),
        ));
  }
}
