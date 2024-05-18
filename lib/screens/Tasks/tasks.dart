import 'package:ca/components/admin/admin_profile.dart';
import 'package:ca/components/admin/more.dart';
import 'package:ca/components/admin/support.dart';
import 'package:ca/screens/Tasks/addTask_Screen.dart';
import 'package:ca/theme/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/daytheme.dart';

class TasksScreen extends StatefulWidget {
  static const String id = 'task_screen';
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
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
      icon: Icon(Icons.person_outlined),
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
    AdminSupportScreen(),
    AdminProfileScreen(),
    AdminMoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: IconButton(
            color: themeprovider.getPurpleTextColor,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              // Add your back button functionality here
            },
          ),
        ),
        title: Text('Tasks',
            style: TextStyle(color: themeprovider.getPrimaryColor)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle add button press
            },
          ),
        ],
        toolbarHeight: 80.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Adjust the height as needed
          child: Divider(
            thickness: 6.0,
            color: Color.fromRGBO(250, 246, 246, 1),
          ), // Change the color as needed
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: GridB(),
            ),
          ),
          // Bottom navigation bar
          BottomNavigationBar(
            items: _bottomNavBarItems,
            currentIndex: _selectedIndex,
            showUnselectedLabels: true,
            selectedItemColor:
                AppColors.primaryColor, // Change the color to your preference
            unselectedItemColor: Colors.grey, // Set the unselected item color
            onTap: _onNavBarItemTapped,
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

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Task added from my office",
    },
    {
      "title": "Task Requested By My Clients",
    },
    {
      "title": "Task under Process",
    },
    {
      "title": "Task Completed",
    },
    {
      "title": "Task Rejected",
    },
    {
      "title": "Task done",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 100,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        if (index == gridMap.length - 1) {
            return GestureDetector(
              onTap: () {
                //Add Skip logic here
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration:
                        const Duration(milliseconds: 400),
                    pageBuilder: (_, __, ___) => AddTaskScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Box shaped image
                  Container(
                    width: 200, // Adjust width as needed
                    height: 200, // Adjust height as needed
                    child: Image.asset(
                      'assets/images/addTaskBox.png', // Path to your image asset
                      fit: BoxFit.contain, // Adjust the fit as needed
                    ),
                  ),
                  // Title text
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image.asset(
                          //   'assets/images/Vector (1).png',
                          //   width: 15.0,
                          //   height: 15.0,
                          // ),
                          Icon(
                            Icons.add,
                          ),
                          Text(
                            "${gridMap.elementAt(index)['title']}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              fontFamily: 'Poppins', // Adjust font size as needed
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
        } else {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              color: Color.fromRGBO(236, 231, 255, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${gridMap.elementAt(index)['title']}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                              const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
