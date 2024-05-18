import 'package:ca/core/router/routers.dart';
import 'package:ca/database/database_service.dart';
import 'package:ca/utility/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Text("Admin Profile"),
            ),
            FloatingActionButton(
              heroTag: '1',
              onPressed: () {
                SharedPref.removeAll();
                DatabaseService.deleteMYDatabase();
                context.go('/${Routers.signIn}');
              },
              tooltip: 'Logout',
              child: const Icon(Icons.logout_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
