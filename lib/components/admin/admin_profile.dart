import 'package:flutter/material.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/background_img.png', // Path to your background image
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text("Admin Profile"),
            )
          ],
        ),
      ),
    );
  }
}
