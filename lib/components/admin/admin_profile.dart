import 'package:ca/core/router/routers.dart';
import 'package:ca/database/database_service.dart';
import 'package:ca/utility/shared_pref.dart';
import 'package:ca/utility/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../utility/user_services.dart';

class AdminProfileScreen extends ConsumerStatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  ConsumerState<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends ConsumerState<AdminProfileScreen> {
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
              onPressed: () async {
                await UserService.clearUserData();
                await DatabaseService.initDatabase();
                setState(() {
                  context.replace('/${Routers.signIn}');
                  context.showSnackbarMessage('Logged Out');
                });
                // context.go('/${Routers.signIn}');
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
