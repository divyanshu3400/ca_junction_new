import 'package:ca/api_services/api_services.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:ca/utility/constants.dart';
import 'package:ca/utility/shared_pref.dart';
import 'package:ca/utility/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../database/database_service.dart';
import '../../models/client_model.dart';

class ClientProfileScreen extends ConsumerStatefulWidget {
  final String clientId;

  const ClientProfileScreen({super.key, required this.clientId});

  @override
  ConsumerState<ClientProfileScreen> createState() => ClientProfileScreenState();

}

class ClientProfileScreenState extends ConsumerState<ClientProfileScreen> {
  final bool hasNotification = true;

  Future<ClientModel> getClient() async {
    final ClientModel? localData = await DatabaseService.database.clientDao.findClientById(int.parse(widget.clientId))
        .first;
    if (localData != null) {
      return localData;
    } else {
      throw Exception('Client not found');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            color: AppColors.primaryColor,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        centerTitle: true,
        toolbarHeight: 60.h,
        actions: [IconButton(
            onPressed: () async {
          ClientModel cl = await getClient();
          setState(() {
            _showBottomSheet(context,cl);
          });
          }, icon: const Icon(Icons.more_vert))],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Adjust the height as needed
          child: Divider(
            thickness: 6.0,
            color: Color.fromRGBO(250, 246, 246, 1),
          ), // Change the color as needed
        ),
      ),
        body: FutureBuilder<ClientModel>(
          future: getClient(), // Method to fetch client data asynchronously
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              // Ensure `Expanded` is used only within `Column`, `Row`, or `Flex`.
              return Padding(
                padding: EdgeInsets.fromLTRB(8.h, 0, 8.h, 8.h),
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      width: 60.h,
                                      height: 60.h,
                                      child: CircularProgressIndicator(
                                        value: 80 / 100,
                                        strokeWidth: 8.0,
                                        backgroundColor: Colors.grey[300],
                                        valueColor: const AlwaysStoppedAnimation<Color>(
                                          AppColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 50.h,
                                      height: 50.h,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/Profile Image.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  "80 %",
                                  style: TextStyle(
                                    fontSize: 16.h,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 5.h),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${snapshot.data?.firstName} ${snapshot.data?.lastName}',
                                  style: TextStyle(
                                    fontSize: 16.h,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  snapshot.data?.getClientData()?.nameOfFirm ?? "",
                                  style: TextStyle(
                                    fontSize: 12.h,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "#563",
                              style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.email_outlined),
                                SizedBox(width: 10.h),
                                Text(
                                  '${snapshot.data?.email}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.phone_in_talk_sharp),
                                SizedBox(width: 10.h),
                                Text(
                                  '${snapshot.data?.phoneNumber}',
                                  style: TextStyle(
                                    fontSize: 14.h,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(color: AppColors.primaryColor),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(4)),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Payment Ledger",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.h),
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(color: AppColors.primaryColor),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(4)),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Ask for payment",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(color: AppColors.primaryColor),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(4)),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Add Data",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.h),
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(color: AppColors.primaryColor),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(4)),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Delete",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: '1',
        onPressed: () {
          Map<String, dynamic> data = {
            "sender": SharedPref.getInt(userId),
            "receiver": widget.clientId,
            "content": "Hello, this is a test notification."
          };
          pushNotification(data);
        },
        tooltip: 'Push Demo Notification',
        label: const Text('Push Demo Notification'),
      ),
    );
  }
  void _showBottomSheet(BuildContext context, ClientModel data) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        // Build the content of the bottom sheet
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.3, // Half the height of the screen
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add your content here
              Text("${data.getClientData()?.gstNumber}",
                style: const TextStyle(
                    fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        );
      },
    );
  }
  Future<void> pushNotification(Map<String, dynamic> data) async {
    String? userToken = SharedPref.getString(token);
    await APIServices.pushNotification('route/notifications', data, userToken!);
    setState(() {
      context.showSnackbarMessage('Notification Sent');
    });
  }
}
