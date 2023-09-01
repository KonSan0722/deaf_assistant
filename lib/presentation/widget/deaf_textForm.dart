import 'package:deaf_assist/application/state/deaf_assist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeafTextForm extends HookConsumerWidget {
  TextEditingController controller = useTextEditingController();
  DeafTextForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intValue = useState(20.0);
    final currentScale = useState(1.0);
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    void handleScaleUpdate(ScaleUpdateDetails details) {
      currentScale.value = details.scale;
      if (currentScale.value > 1.0) {
        if (intValue.value > 60.0) {
          intValue.value;
        } else {
          intValue.value++;
        }
      } else if (currentScale.value < 1.0) {
        if (intValue.value > 20) {
          intValue.value--;
        } else {
          intValue.value;
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: SizedBox(
          width: width / 10 * 9,
          child: GestureDetector(
            onScaleUpdate: handleScaleUpdate,
            child: TextFormField(
              maxLength: 50,
              maxLines: 5,
              controller: controller,
              style: TextStyle(fontSize: intValue.value),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: height / 10 * 2),
                hintText: "ここに入力されます",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
