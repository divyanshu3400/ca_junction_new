import 'package:flutter/material.dart';

class CustomLoaderDialog extends StatelessWidget {
  final String message;

  const CustomLoaderDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent, // Transparent background
      elevation: 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/gif-loader.gif', // Replace 'assets/loading.gif' with your actual GIF path
                height: 30, // Adjust the height as needed
                width: 30, // Adjust the width as needed
              ),
              const SizedBox(width: 10), // Add some space between the image and text
              Text(
                message,
                style:const TextStyle(fontSize: 16), // Adjust the font size as needed
              ),
            ],
          ),
        ),
      ),
    );
  }
}
