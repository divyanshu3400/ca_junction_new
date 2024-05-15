import 'package:ca/core/router/routers.dart';
import 'package:ca/features/home/dashboard/root/presentation/riverpod/bottom_nav_provider.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final position = ref.watch(bottomStateProvider);

    return NavigationBar(
      destinations: const [
        NavigationDestination(
          selectedIcon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.headset_mic_outlined, color: Colors.white),
          icon: Icon(Icons.headphones),
          label: 'Support',
        ),
        NavigationDestination(
          selectedIcon:
              Icon(Icons.person_2_outlined, color: Colors.white),
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.dashboard_outlined, color: Colors.white),
          icon: Icon(Icons.dashboard),
          label: 'More',
        ),
      ],
      selectedIndex: position,
      indicatorColor: AppColors.primaryColor,
      onDestinationSelected: _onItemTapped,
    );
  }

  void _onItemTapped(index) {
    ref.read(bottomStateProvider.notifier).setIndex(index);
    HapticFeedback.mediumImpact();
    switch (index) {
      case 0:
        context.go('/${Routers.home}');
        break;
      case 1:
        context.go('/${Routers.support}');
        break;
      case 2:
        context.go('/${Routers.profile}');
        break;
      case 3:
        context.go('/${Routers.more}');
    }
  }
}
