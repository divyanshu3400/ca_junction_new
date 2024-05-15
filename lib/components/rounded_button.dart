import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.colour,
    required this.title,
    required this.onPressed,
    this.border,
    required this.textColor,
  });

  final Color colour;
  final String title;
  final Function onPressed;
  final Color? border;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: border ?? Colors.transparent, // Use default color if border is null
                width: 1.0, // Border width
              ),
            ),
            child: Material(
              color: colour,
              borderRadius: BorderRadius.circular(8.0),
              child: MaterialButton(
                onPressed: () {
                  onPressed();
                },
                minWidth: 200.0,
                height: 56.0,
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
