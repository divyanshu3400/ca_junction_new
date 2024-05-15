import 'package:flutter/material.dart';

class OTPInput extends StatefulWidget {
  final int numberOfNodes;
  final Function(String) onFilled;

  const OTPInput({super.key, required this.numberOfNodes, required this.onFilled});

  @override
  _OTPInputState createState() => _OTPInputState();
}
class _OTPInputState extends State<OTPInput> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _initializeLists(widget.numberOfNodes);
    _addListeners();
  }

  void _initializeLists(int numberOfNodes) {
    _focusNodes = List.generate(numberOfNodes, (index) => FocusNode());
    _controllers = List.generate(numberOfNodes, (index) => TextEditingController());
  }

  void _addListeners() {
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.isEmpty && i > 0 && _controllers[i - 1].text.isNotEmpty) {
          FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
        }
      });
    }
  }

  @override
  void didUpdateWidget(covariant OTPInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.numberOfNodes != _focusNodes.length) {
      _disposeLists();
      _initializeLists(widget.numberOfNodes);
      _addListeners();
    }
  }

  void _disposeLists() {
    _focusNodes.forEach((node) => node.dispose());
    _controllers.forEach((controller) => controller.dispose());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        _controllers.length,
            (index) => SizedBox(
          width: 50,
          height: 50,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (index < _controllers.length - 1) {
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                } else {
                  FocusScope.of(context).unfocus();
                  String otp = _controllers.map((controller) => controller.text).join();
                  widget.onFilled(otp);
                }
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _disposeLists();
    super.dispose();
  }
}
