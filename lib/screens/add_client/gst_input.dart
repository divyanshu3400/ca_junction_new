import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GSTNumberInput extends StatefulWidget {
  const GSTNumberInput({Key? key}) : super(key: key);

  @override
  GSTNumberInputState createState() => GSTNumberInputState();
}

class GSTNumberInputState extends State<GSTNumberInput> {
  List<TextEditingController> controllers = List.generate(15, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(15, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onInputChanged(int index, String value) {
    if (value.isNotEmpty && index < 14) {
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void _handleKeyEvent(int index, RawKeyEvent event) {
    if (event is RawKeyDownEvent && event.logicalKey == LogicalKeyboardKey.backspace) {
      if (controllers[index].text.isEmpty && index > 0) {
        controllers[index - 1].clear();
        focusNodes[index - 1].requestFocus();
      }
    }
  }

  String getGSTNumber() {
    return controllers.map((controller) => controller.text.toUpperCase()).join();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(15, (index) {
        return SizedBox(
          width: 20,
          child: RawKeyboardListener(
            focusNode: FocusNode(),  // A dummy focus node to listen for key events
            onKey: (event) => _handleKeyEvent(index, event),
            child: TextFormField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              cursorColor: Colors.blue,  // Replace with AppColors.primaryColor
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),  // Replace with AppColors.primaryColor
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                counterText: "",
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                UpperCaseTextFormatter(),
              ],
              keyboardType: TextInputType.text,
              textInputAction: index < 14 ? TextInputAction.next : TextInputAction.done,
              onChanged: (value) => _onInputChanged(index, value),
            ),
          ),
        );
      }),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
