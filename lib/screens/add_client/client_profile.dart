import 'package:ca/theme/daytheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final ClientModel? localData = await DatabaseService.database.clientDao.findClientById(int.parse(widget.clientId)).first;
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
          'Client Profile',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        centerTitle: true,
        toolbarHeight: 80.0,
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
            return const Center(child: CircularProgressIndicator(),);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Display the UI using the fetched data
            return SingleChildScrollView(
              child: Column(
                children: [
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
            );
          }
        },
      ),
    );

  }
}
