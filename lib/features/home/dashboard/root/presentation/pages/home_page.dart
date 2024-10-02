import 'package:ca/core/network_connectivity_check/network_connectivity_provider.dart';
import 'package:ca/core/router/routers.dart';
import 'package:ca/features/home/dashboard/root/presentation/riverpod/user_data_notifier.dart';
import 'package:ca/features/home/dashboard/root/presentation/riverpod/user_provider.dart';
import 'package:ca/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../components/admin/riverpod/category_details_notifier.dart';
import '../../../../../../theme/daytheme.dart';
import '../../../../../../utility/base_state.dart';
import '../../../../../../utility/ui_utils.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();

}

class _HomePageState extends ConsumerState<HomePage> {
  final bool hasNotification = true;

  @override
  void initState() {
    // Future(() {
    //   ref.read(connectivityStatusProviders.notifier).checkStatus();
    // });
    // Future(() {
    //   ref.read(userDataNotifierProvider.notifier).fetchUserDataAPI();
    // });
    // super.initState();
    // requestNotificationPermission(context);
  }

  @override
  void dispose() {
    ref.read(connectivityStatusProviders.notifier).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_img.png',
              // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background_img.png', // Path to your background image
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Consumer(
                builder: (context, watch, child) {
                  // final state = watch.watch(userDataNotifierProvider);
                  // if (state.status == Status.loading) {
                  //   return const Center(child: CircularProgressIndicator());
                  // } else if (state.status == Status.error) {
                  //   return Center(child: Text('${state.message}'));
                  // } else if (state.status == Status.success) {
                  //   User? user = state.data;
                    return Column(
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.only(top: 40.h, left: 8.h, right: 8.h),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.person,
                                  size: 40.h,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              SizedBox(width: 10.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Welcome Back",
                                    style: TextStyle(
                                      fontSize: 10.h,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    // '${user?.firstName ?? ""} ${user?.lastName ?? ""}',
                                    'Dhairya Seth',
                                    style: TextStyle(
                                        fontSize: 14.h, color: Colors.white),
                                  ),
                                  Text(
                                    // '#${user?.username.toString().toUpperCase()}',
                                    '#DHAIRYA',
                                    style: TextStyle(
                                        fontSize: 12.h, color: Colors.white),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.refresh_sharp,
                                    color: Colors.white),
                                onPressed: () {
                                  // userAsyncData
                                },
                              ),
                              IconButton(
                                icon: hasNotification
                                    ? Image.asset('assets/images/notification.png')
                                    : const Icon(Icons.notifications,
                                    color: Colors.white),
                                onPressed: () {
                                  // Notification action
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Card(
                          elevation: 1,
                          margin: EdgeInsets.all(16.h),
                          color: AppColors.cardColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        // user?.role.toString().toUpperCase() ?? " ",
                                        'SDE',
                                        style: TextStyle(
                                          fontSize: 12.h,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        // '#${user?.username.toString().toUpperCase()}',
                                        '#DHAIRYA',
                                        style: TextStyle(
                                          fontSize: 14.h,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  )

                              ),
                              GridView.count(
                                crossAxisCount: 3,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  _buildGridItem(
                                      "assets/images/people.png", 'My Clients', () {
                                    context.push('/${Routers.myClients}');
                                  }),
                                  _buildGridItem(
                                      "assets/images/req.png", 'Pending Requests',
                                          () {
                                        context.push('/${Routers.myClients}');
                                      }),
                                  _buildGridItem("assets/images/payment.png",
                                      'Add Payments', () {context.push('/${Routers.clientPayment}');}),
                                  _buildGridItem(
                                      "assets/images/mytask.png", 'My Tasks', () {}),
                                  _buildGridItem("assets/images/task.png",
                                      'Task For Client', () {}),
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
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
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
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
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
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
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
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                        color: AppColors.iconBackgroundColor,
                                        // Light gray color
                                      ),
                                      child: Center(
                                        child: Text(
                                          "User Management",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 12.h,
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
                    );
                  // }
                  // return Container();
                },
              ),
            ),
          ),
        ],
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
              width: 44.h, // Adjust the width and height to fit your icon
              height: 44.h,
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
            SizedBox(height: 8.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 12.h, color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
