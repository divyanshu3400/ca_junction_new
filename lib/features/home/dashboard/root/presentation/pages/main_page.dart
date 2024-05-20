import 'package:ca/features/home/dashboard/root/presentation/pages/bottom_nav.dart';
import 'package:flutter/material.dart';

import '../../../../../../database/database_service.dart';
import '../../../../../../utility/hive_service.dart';
import '../../../../../../utility/shared_pref.dart';

class MainPage extends StatefulWidget {
  const MainPage({required this.child, super.key});
  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
