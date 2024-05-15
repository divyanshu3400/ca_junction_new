import 'package:ca/components/admin/admin_profile.dart';
import 'package:ca/components/admin/dashboard.dart';
import 'package:ca/components/admin/more.dart';
import 'package:ca/components/admin/support.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatefulWidget {
  static const String id = 'admin_home_screen';

  const AdminHomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<AdminHomeScreen> {
  int _selectedIndex = 0;

  // Define a list of bottom navigation bar items
  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.headset_mic_outlined),
      label: 'Support',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_2_outlined),
      label: 'Profile',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.dashboard_rounded),
      label: 'More',
    ),
  ];

  // Define a list of pages corresponding to each bottom navigation bar item
  final List<Widget> _pages = [
    // Define your home page widget here
    DashboardScreen(),
    AdminSupportScreen(),
    AdminProfileScreen(),
    AdminMoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_img.png', // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Column(
            children: [
              Expanded(
                child: _pages[_selectedIndex], // Show selected page
              ),
              // Bottom navigation bar
              BottomNavigationBar(
                items: _bottomNavBarItems,
                currentIndex: _selectedIndex,
                showUnselectedLabels: true,
                selectedItemColor: AppColors.primaryColor, // Change the color to your preference
                unselectedItemColor: Colors.grey, // Set the unselected item color
                onTap: _onNavBarItemTapped,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Method to handle bottom navigation bar item taps
  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
