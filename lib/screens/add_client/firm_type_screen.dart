import 'package:ca/api_services/api_services.dart';
import 'package:ca/core/router/routers.dart';
import 'package:ca/screens/add_client/riverpod/firm_type_provider.dart';
import 'package:ca/utility/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../theme/daytheme.dart';
import '../../utility/constants.dart';
import '../../utility/custom_loader.dart';
import '../../utility/hive_service.dart';
import '../Tasks/addTask_Screen.dart';

class FirmTypeScreen extends ConsumerStatefulWidget {

  const FirmTypeScreen({
    super.key,
  });

  @override
  ConsumerState<FirmTypeScreen> createState() => _FirmTypeScreenState();

}

class _FirmTypeScreenState extends ConsumerState<FirmTypeScreen> {
  int selectedFirmType  = 1;

  @override
  Widget build(BuildContext context) {
    final firmTypeAsyncValue = ref.watch(firmTypeProvider);
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
              context.pushReplacement('/${Routers.userRegisteredAs}');
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
                Text("Type Of Firm",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("Select any one",),
              ],
            ),

            const SizedBox(height: 20),
            Expanded(
              child: Container(
                child: firmTypeAsyncValue.when(
                  data: (registrationTypes) {
                    return ListView.builder(
                      itemCount: registrationTypes.length,
                      itemBuilder: (context, index) {
                        final type = registrationTypes[index];
                        return RadioListTile(
                          title: Text(type.firm),
                          value: type.id, // Set the value to the ID of the type
                          onChanged: (int? value) {
                            setState(() {
                              if (value != null) {
                                selectedFirmType = value; // Update the selected value
                              }
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          groupValue: selectedFirmType, // Set the groupValue to the selected value
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => Center(child: Text('Error: $error')),
                ),
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
          padding: const EdgeInsets.all(16),
          child: RoundedButton2(
            colour: const Color.fromRGBO(255, 255, 255, 1),
            onPressed: () async {
              if (firmTypeAsyncValue.value!.isNotEmpty) {
                bool proceed = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirmation'),
                      content: const Text('Do you want to proceed with the selected firm type?'),
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
                );

                if (proceed) {
                  addClientData['firm_type'] = selectedFirmType;
                  _handleSubmit(addClientData);
                }
              } else {
                context.showSnackbarMessage("Please Select Firm Type");
              }
            },
            title: 'Submit',
            border: const Color.fromRGBO(16, 13, 64, 1),
            textColor: const Color.fromRGBO(16, 13, 64, 1),
          ),
        )
      ],
    );
  }
  
  void _handleSubmit(Map<String,dynamic> addClientData) async{
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent user from dismissing dialog
      builder: (BuildContext context) {
        return const CustomLoaderDialog(message: 'Creating User. Please wait...');
      },
    );
    dynamic response = await APIServices.makePostRequest('api/create_customer/', addClientData);
    setState(() {
      context.showSnackbarMessage(response['message']);
      context.pop();
    });
    if(response['status'] ==200){
      setState(() {
        context.pushReplacement('/${Routers.myClients}');
      });
    }

  }
}
