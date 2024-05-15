import 'dart:convert';

import 'package:ca/core/router/routers.dart';
import 'package:ca/features/home/dashboard/root/presentation/riverpod/user_provider.dart';
import 'package:ca/models/district_model.dart';
import 'package:ca/models/state_model.dart';
import 'package:ca/screens/add_client/riverpod/add_client_provider.dart';
import 'package:ca/screens/add_client/riverpod/district_value_provider.dart';
import 'package:ca/screens/add_client/riverpod/state_value_provider.dart';
import 'package:ca/utility/constants.dart';
import 'package:ca/utility/hive_service.dart';
import 'package:ca/utility/ui_utils.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../core/constant/text_style.dart';
import '../../theme/daytheme.dart';
import '../../theme/dimens.dart';
import '../../utility/dropdown.dart';
import '../Tasks/addTask_Screen.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class AddNewUserScreen extends ConsumerStatefulWidget {
  const AddNewUserScreen({super.key});

  @override
  AddNewUserScreenState createState() => AddNewUserScreenState();
}

class AddNewUserScreenState extends ConsumerState<AddNewUserScreen> {
  String userPhoneNumber = '';
  String isoCode = 'IN';
  String countryCode = '+91';

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(addClientStateProvider);
    final notifier = ref.watch(addClientStateProvider.notifier);
    final statesAsyncValue = ref.watch(statesProvider);
    final districtsAsyncValue = ref.watch(districtsProvider);
    final userAsyncValue = ref.watch(userDataProvider);

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
              // Add your back button functionality here
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: notifier.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("GST Number",style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: notifier.gstNumberController,
                  decoration: const InputDecoration(),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: notifier.nameOfFirmController,
                  decoration: kinputBorderDecoration('Name of Firm'),
                  validator: Validators.isValidName,
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: notifier.nameOfPersonController,
                  decoration: kinputBorderDecoration('Name of Person (Authorized)'),
                  validator: Validators.isValidName,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: notifier.dobController,
                  readOnly: true, // Set readOnly to true to prevent manual editing of the field
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    labelStyle: const TextStyle(
                      color: Color.fromRGBO(2, 6, 20, 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimen.inputBorderRadius4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(Dimen.inputBorderRadius4),
                    ),
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
                          notifier.dobController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                        }
                      },
                      child:const Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),

                // decoration: InputDecoration(labelText: 'Phone Number'),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.textColor,
                      width: 1.0,
                    ), // Customize border properties as needed
                    borderRadius: BorderRadius.circular(
                        4), // Adjust border radius as needed
                    // color: const Color.fromRGBO(245, 245, 245, 1),
                  ),
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (value) {
                      notifier.phoneNumber = value.phoneNumber!;
                    },
                    initialValue:
                        PhoneNumber(isoCode: isoCode, dialCode: countryCode),
                    keyboardType: TextInputType.phone,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Poppins',
                    ),
                    cursorColor: AppColors.primaryColor,
                    inputBorder: const OutlineInputBorder(),
                    inputDecoration: const InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(color: AppColors.textColor),
                      border: InputBorder
                          .none, // Set input border to none to avoid duplication
                    ),
                  ),
                ),

                const SizedBox(height: 16.0),
                TextFormField(
                  controller: notifier.emailController,
                  decoration: kinputBorderDecoration('Email ID'),
                  validator: Validators.isValidEmail,
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
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
                              context.showSnackbarMessage("Please Select State");
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
                    const SizedBox(width: 20),
                    Expanded(
                        child: districtsAsyncValue.when(
                      data: (districtsList) {
                        return DropdownFormField<DistrictModel>(
                          onEmptyActionPressed: (dynamic obj) async {},
                          dropdownItemSeparator: const Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.arrow_drop_down),
                              labelText: "Select District"),
                          onSaved: (dynamic item) {
                            // Handle saved member
                          },
                          onChanged: (dynamic item) {
                            notifier.selectedDistrict = item;
                          },
                          validator: (dynamic value) {
                            if (notifier.selectedState == null) {
                              setState(() {
                                context.showSnackbarMessage(
                                    "Please Select district");
                              });
                            }
                            return null;
                          },
                          // Add your validation logic if needed
                          displayItemFn: (dynamic item) => item != null
                              ? Text(
                                  item.district,
                                  style: const TextStyle(fontSize: 16),
                                )
                              : const SizedBox(),
                          findFn: (String str) async => districtsList,
                          selectedFn: (dynamic item1, dynamic item2) {
                            return item1 == item2;
                          },
                          filterFn: (dynamic member, String str) {
                            final String name =
                                (member as DistrictModel).district.toLowerCase();
                            final String searchLowerCase = str.toLowerCase();
                            return name.contains(searchLowerCase);
                          },
                          dropdownItemFn: (dynamic item,
                                  int position,
                                  bool focused,
                                  bool selected,
                                  Function() onTap) =>
                              ListTile(
                            title: Text('${item?.district}'),
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
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: kinputBorderDecoration('Pin Code'),
                        validator: Validators.isValidName,
                        controller: notifier.pinCodeController,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        decoration: kinputBorderDecoration('Admin ID'),
                        initialValue:userAsyncValue.value?.lastName ,
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        Container(
          padding: const EdgeInsets.all(16),
          child: RoundedButton2(
            colour: const Color.fromRGBO(255, 255, 255, 1),
            onPressed: () async {
              bool isValid = await notifier.validate();
              // context.push('/${Routers.userRegisteredAs}');
              if (isValid) {
                var random = Random();
                var randomNumber = random.nextInt(9000) + 1000;
                String fullName = notifier.nameOfPersonController.text.toString().trim();
                List<String> nameParts = fullName.split(' ');
                var firstName = nameParts[0];
                var lastName = nameParts.sublist(1).join(' ');
                firstName = firstName.trim();
                lastName = lastName.trim();
                Map<String, dynamic> addClientData = {
                  "first_name":firstName,
                  "admin_id":userAsyncValue.value?.id,
                  "username":'$firstName$randomNumber',
                  "last_name":lastName,
                  "email":notifier.emailController.text.toString().trim(),
                  "gst_number" : notifier.gstNumberController.text.toString().trim(),
                  "phone_number":notifier.phoneNumber.toString().trim(),
                  "dob":notifier.dobController.text.toString().trim(),
                  "state_id":notifier.selectedState?.id,
                  "district_id":notifier.selectedDistrict?.id,
                  "pincode":notifier.pinCodeController.text.toString().trim(),
                  "name_of_firm":notifier.nameOfFirmController.text.toString().trim()
                };
                HiveService().putData(userDataKey, addClientData);
                setState(() {
                  context.push('/${Routers.userRegisteredAs}');

                });
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
}