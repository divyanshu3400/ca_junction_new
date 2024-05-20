import 'package:ca/riverpod/registration_type_provider.dart';
import 'package:ca/utility/constants.dart';
import 'package:ca/utility/hive_service.dart';
import 'package:ca/utility/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/routers.dart';
import '../../theme/daytheme.dart';

class UserRegisteredAsScreen extends ConsumerStatefulWidget {
  const UserRegisteredAsScreen({super.key});

  @override
  ConsumerState<UserRegisteredAsScreen> createState() =>
      _UserRegisteredAsScreenState();
}

class _UserRegisteredAsScreenState extends ConsumerState<UserRegisteredAsScreen> {
  List<int> selectedRegTypes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final registrationTypeAsyncValue = ref.watch(registrationTypeProvider);
    Map<String,dynamic> addClientData = HiveService().getData(userDataKey);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            color: AppColors.primaryColor,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.pushReplacement('/${Routers.myClients}');
            },
          ),
        ),
        title: const Text('Add New User',
            style: TextStyle(color: AppColors.primaryColor)),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("User Registered As",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("Select One or More",),
              ],
            ),

            const SizedBox(height: 20),
            Expanded(
              child: Container(
                child: registrationTypeAsyncValue.when(
                  data: (registrationTypes) {
                    return ListView.builder(
                        itemCount: registrationTypes.length,
                        itemBuilder: (context, index) {
                          final type = registrationTypes[index];
                          return CheckboxListTile(
                            title: Text('${type.type}'),
                            value: selectedRegTypes.contains(type.id),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value != null && value) {
                                  selectedRegTypes.add(type.id!);
                                } else {
                                  selectedRegTypes.remove(type.id);
                                }
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          );
                        });
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) =>
                      Center(child: Text('Error: $error')),
                ),
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.pushReplacement('/${Routers.userRegisteredAs}');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white70,
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text('Previous'),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    if (selectedRegTypes.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirmation'),
                            content: const Text('Do you want to proceed with the selected registration types?'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  context.pop(false); // Return false when cancelled
                                },
                              ),
                              TextButton(
                                child: const Text('Confirm'),
                                onPressed: () {
                                  context.pop(true); // Return true when confirmed
                                },
                              ),
                            ],
                          );
                        },
                      ).then((proceed) {
                        if (proceed) {
                          addClientData["registration_types"] = selectedRegTypes;
                          HiveService().putData(userDataKey, addClientData);
                          context.pushReplacement('/${Routers.firmType}');
                        }
                      });
                    } else {
                      context.showSnackbarMessage("Please select registration type");
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white70,
                    side:const BorderSide(color: AppColors.primaryColor), // Add border side
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
