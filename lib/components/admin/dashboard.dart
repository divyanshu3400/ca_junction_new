import 'package:ca/components/admin/my_client.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:flutter/material.dart';

import 'client_requests.dart';

class DashboardScreen extends StatelessWidget {
  final String userName = 'CA ALok Mani';
  final String designation = '# Alok 192';
  final bool hasNotification = true;

  const DashboardScreen({super.key});

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
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
              child: Row(
                children: <Widget>[
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        userName,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        designation,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.refresh_sharp, color: Colors.white),
                    onPressed: () {
                      // Refresh action
                    },
                  ),
                  IconButton(
                    icon: hasNotification
                        ? Image.asset('assets/images/notification.png')
                        : const Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {
                      // Notification action
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 1,
              margin: const EdgeInsets.all(26),
              color: AppColors.cardColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 16, 20, 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Office Manager',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            designation,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildGridItem("assets/images/people.png", 'My Clients',
                          () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 400),
                            pageBuilder: (_, __, ___) => const MyClientScreen(),
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
                      }),
                      _buildGridItem(
                          "assets/images/req.png", 'Pending Requests', () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                            const Duration(milliseconds: 400),
                            pageBuilder: (_, __, ___) => ClientRequestsScreen(),
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
                        );                      }),
                      _buildGridItem(
                          "assets/images/payment.png", 'Add Payments', () {
                        print("Add Payments");
                      }),
                      _buildGridItem(
                          "assets/images/mytask.png", 'My Tasks', () {}),
                      _buildGridItem(
                          "assets/images/task.png", 'Task For Client', () {}),
                      _buildGridItem(
                          "assets/images/graph.png", 'Reports', () {}),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          width: 120,
                          height: 70,
                          margin: const EdgeInsets.only(right: 8),
                          // Add margin for spacing
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.iconBackgroundColor,
                            // Light gray color
                          ),
                          child: const Center(
                            child: Text(
                              "New Updates",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 120,
                          height: 70,
                          margin: const EdgeInsets.only(left: 8),
                          // Add margin for spacing
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.iconBackgroundColor,
                            // Light gray color
                          ),
                          child: const Center(
                            child: Text(
                              "Dropbox",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          width: 120,
                          height: 70,
                          margin: const EdgeInsets.only(right: 8),
                          // Add margin for spacing
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.iconBackgroundColor,
                            // Light gray color
                          ),
                          child: const Center(
                            child: Text(
                              "Legal Services",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 120,
                          height: 70,
                          margin: const EdgeInsets.only(left: 8),
                          // Add margin for spacing
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.iconBackgroundColor,
                            // Light gray color
                          ),
                          child: const Center(
                            child: Text(
                              "User Management",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(String imgPath, String label, VoidCallback onTap) {
    return Material(
      type: MaterialType.transparency,
      // Add this line to enable the ripple effect
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64, // Adjust the width and height to fit your icon
              height: 64,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.iconBackgroundColor,
                // Light gray color
              ),
              child: Center(
                child: Image.asset(
                  imgPath,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 14, color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
