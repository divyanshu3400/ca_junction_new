import 'package:ca/components/admin/payment/client_list_payment_provider.dart';
import 'package:ca/components/admin/riverpod/category_details_provider.dart';
import 'package:ca/components/admin/services_list.dart';
import 'package:ca/core/router/routers.dart';
import 'package:ca/models/client_model.dart';
import 'package:ca/models/registration_type_model.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:ca/utility/ui_utils.dart';
import 'package:ca/utility/validators_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../models/state_model.dart';
import '../../../screens/add_client/riverpod/state_value_provider.dart';
import '../../../utility/base_state.dart';
import '../../../utility/dropdown.dart';
import '../../rounded_button.dart';
import 'package:intl/intl.dart';


class MyClientPaymentScreen extends ConsumerStatefulWidget {
  const MyClientPaymentScreen({Key? key}) : super(key: key);

  @override
  MyClientScreenState createState() => MyClientScreenState();
}

class MyClientScreenState extends ConsumerState<MyClientPaymentScreen>  {
  RegistrationType? selectedService;
  String query = '';

  FocusNode myFocusNode = FocusNode();

  String _selectedOption = "Reason Of Payment";
  final List<String> _options = ["Option 1", "Option 2", "Option 3", "Option 4"];

  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(clientFilteredNotifierProvider.notifier).fetchClientsFromAPI();
    });
  }
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(clientFilteredNotifierProvider.notifier);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Payments"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/${Routers.home}');
          },
        ),
      ),
      body: Column(
        children: [
          ServiceList(
            onServiceSelected: notifier.filterRegisteredTypeClients,
            selectedRegType: selectedService,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: TextFormField(
              controller: notifier.searchController,
              decoration: InputDecoration(
                hintText: 'Search Clients',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(color: Colors.grey[100]!),
                ),
                suffixIcon: const Icon(Icons.search),
              ),
              onChanged: (query) {
                notifier.searchClients(query);
              },
            ),
          ),
          Expanded(
            child: Consumer(
              builder: (context, watch, child) {
                final state = watch.watch(clientFilteredNotifierProvider);
                if (state.status == Status.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status == Status.error) {
                  return Center(child: Text('${state.message}'));
                } else if (state.status == Status.success) {
                  final clients = state.data ?? [];
                  return ListView.builder(
                    controller: notifier.scrollController,
                    itemCount: clients.length,
                    itemBuilder: (BuildContext context, int index) {
                      final client = clients[index];
                      return Card(
                        elevation: 0.3,
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 50,
                            child: Icon(Icons.person),
                          ),
                          title: Text(
                            '${client.firstName} ${client.lastName == "NA" ? "" : client.lastName}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '#Client ${client.username}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                          onTap: () {
                            // context.push('/${Routers.clientProfile}/${client.id}');
                            _showBottomSheet(context,client);
                            HapticFeedback.mediumImpact();
                          },
                        ),
                      );
                    },
                  );
                }

                return Container();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/${Routers.addClient}');
        },
        backgroundColor: AppColors.iconBackgroundColor,
        child: const Icon(Icons.person_add),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, ClientModel data) {
    final statesAsyncValue = ref.watch(statesProvider);
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final notifier = ref.watch(clientPaymentProvider.notifier);
        // Build the content of the bottom sheet
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.6, // Half the height of the screen
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: Form(
              key: notifier.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add your content here
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          '${data.firstName} ${data.lastName}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      Text(
                          '# ${data.id}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  TextFormField(
                    controller: notifier.dateOfPayment,
                    validator: Validators.isValidName,
                    cursorColor: AppColors.mutedTextColor,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          // Show a date picker dialog when the calendar icon is tapped
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          // If a date is picked, set it to the text field
                          if (pickedDate != null) {
                            notifier.dateOfPayment.text =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                          }
                        },
                        child: const Icon(Icons.calendar_today),
                      ),
                      labelText: 'Date Of Payment',
                      labelStyle: const TextStyle(
                        color: Color.fromRGBO(2, 6, 20, 1),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(15, 13, 35, 1), width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // Expanded(
                  //     child: statesAsyncValue.when(
                  //       data: (states) {
                  //         return DropdownFormField<StateModel>(
                  //           onEmptyActionPressed: (dynamic obj) async {},
                  //           dropdownItemSeparator: const Divider(
                  //             color: Colors.black,
                  //             height: 1,
                  //           ),
                  //           decoration: const InputDecoration(
                  //               border: OutlineInputBorder(),
                  //               suffixIcon: Icon(Icons.arrow_drop_down),
                  //               labelText: "Select State"),
                  //           onSaved: (dynamic item) {
                  //             // Handle saved member
                  //           },
                  //           onChanged: (dynamic item) {
                  //             notifier.selectedState = item;
                  //           },
                  //           validator: (dynamic value) {
                  //             if (notifier.selectedState == null) {
                  //               context
                  //                   .showSnackbarMessage("Please Select State");
                  //             }
                  //             return null;
                  //           },
                  //           // Add your validation logic if needed
                  //           displayItemFn: (dynamic item) => item != null
                  //               ? Text(
                  //             item.state,
                  //             style: const TextStyle(fontSize: 16),
                  //           )
                  //               : const SizedBox(),
                  //           findFn: (String str) async => states,
                  //           selectedFn: (dynamic item1, dynamic item2) {
                  //             return item1 == item2;
                  //           },
                  //           filterFn: (dynamic state, String str) {
                  //             final String name =
                  //             (state as StateModel).state.toLowerCase();
                  //             final String searchLowerCase = str.toLowerCase();
                  //             return name.contains(searchLowerCase);
                  //           },
                  //           dropdownItemFn: (dynamic item,
                  //               int position,
                  //               bool focused,
                  //               bool selected,
                  //               Function() onTap) =>
                  //               ListTile(
                  //                 title: Text('${item?.state}'),
                  //                 tileColor: focused
                  //                     ? Colors.blue.shade100
                  //                     : Colors.transparent,
                  //                 onTap: onTap,
                  //               ),
                  //         );
                  //       },
                  //       loading: () =>
                  //       const Center(child: CircularProgressIndicator()),
                  //       error: (error, stackTrace) =>
                  //           Center(child: Text('Error: $error')),
                  //     )),
                  GestureDetector(
                    onTap: () async{

                      final selectedOption = await _showOptionsDialog(context);
                      print("Here is $selectedOption");
                      if(selectedOption != null) {
                        setState(() {
                          _selectedOption = selectedOption;
                          print("Here is final $_selectedOption");
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              _selectedOption,
                            style: TextStyle(
                              color: Color.fromRGBO(2, 6, 20, 1),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: notifier.amountReceived,
                    validator: Validators.isValidName,
                    cursorColor: AppColors.mutedTextColor,
                    decoration: InputDecoration(
                      labelText: 'Amount Received',
                      labelStyle: const TextStyle(
                        color: Color.fromRGBO(2, 6, 20, 1),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(15, 13, 35, 1), width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                      child: statesAsyncValue.when(
                        data: (states) {
                          return DropdownFormField<StateModel>(
                            onEmptyActionPressed: (dynamic obj) async {},
                            dropdownItemSeparator: const Divider(
                              color: Colors.black,
                              height: 1,
                            ),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.arrow_drop_down),
                                labelText: "Select State"),
                            onSaved: (dynamic item) {
                              // Handle saved member
                            },
                            onChanged: (dynamic item) {
                              notifier.selectedState = item;
                            },
                            validator: (dynamic value) {
                              if (notifier.selectedState == null) {
                                context
                                    .showSnackbarMessage("Please Select State");
                              }
                              return null;
                            },
                            // Add your validation logic if needed
                            displayItemFn: (dynamic item) => item != null
                                ? Text(
                              item.state,
                              style: const TextStyle(fontSize: 16),
                            )
                                : const SizedBox(),
                            findFn: (String str) async => states,
                            selectedFn: (dynamic item1, dynamic item2) {
                              return item1 == item2;
                            },
                            filterFn: (dynamic state, String str) {
                              final String name =
                              (state as StateModel).state.toLowerCase();
                              final String searchLowerCase = str.toLowerCase();
                              return name.contains(searchLowerCase);
                            },
                            dropdownItemFn: (dynamic item,
                                int position,
                                bool focused,
                                bool selected,
                                Function() onTap) =>
                                ListTile(
                                  title: Text('${item?.state}'),
                                  tileColor: focused
                                      ? Colors.blue.shade100
                                      : Colors.transparent,
                                  onTap: onTap,
                                ),
                          );
                        },
                        loading: () =>
                        const Center(child: CircularProgressIndicator()),
                        error: (error, stackTrace) =>
                            Center(child: Text('Error: $error')),
                      )),
                  SizedBox(height: 10.h),
                  RoundedButton(colour: Colors.white, border: Color.fromRGBO(16, 13, 64, 1), title: 'SUBMIT', onPressed: (){}, textColor: Color.fromRGBO(16, 13, 64, 1),),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  // Future<String?> _showOptionsDialog() async{
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       // String? selectedOption = _selectedOption;
  //       return AlertDialog(
  //         title: Text("Select an Option"),
  //         content: SingleChildScrollView(
  //           child: Column(
  //             children: _options.map((option) {
  //               return RadioListTile<String>(
  //                 title: Text(option),
  //                 value: option,
  //                 groupValue: _selectedOption,
  //                 onChanged: (value) {
  //                   setState(() {
  //                     _selectedOption = value!;
  //                     print(_selectedOption);
  //                     context.pop(value);
  //                   });
  //                 },
  //               );
  //             }).toList(),
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             child: Text("Cancel"),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Future<String?> _showOptionsDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String? selectedOption = _selectedOption;
        return AlertDialog(
          title: Text("Select an Option"),
          content: SingleChildScrollView(
            child: Column(
              children: _options.map((option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                      print(value);
                    });
                    context.pop(value); // Use context.pop to return the selected value
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


}
