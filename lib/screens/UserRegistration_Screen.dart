import 'package:ca/core/constant/text_style.dart';
import 'package:ca/screens/Tasks/addTask_Screen.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:ca/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({super.key});

  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  late String userPhoneNumber;
  String isoCode = 'IN';
  String countryCode = '+91';

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
              // Add your back button functionality here
            },
          ),
        ),
        title:const Text('Add New User',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("GST Number"),
              const SizedBox(height: 16.0),
              // const OtpForm2(),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: kinputBorderDecoration('Name of Firm'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: kinputBorderDecoration('Name of Person'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
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
                        color: Color.fromRGBO(15, 13, 35, 1), width: 1.0),
                    borderRadius: BorderRadius.circular(Dimen.inputBorderRadius4),
                  ),
                  // suffixIcon: Image.asset('assets/images/Calendar.png'),
                ),
              ),
              const SizedBox(height: 16.0),

              // decoration: InputDecoration(labelText: 'Phone Number'),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(15, 13, 35, 1),
                    width: 1.0,
                  ), // Customize border properties as needed
                  borderRadius: BorderRadius.circular(
                      4), // Adjust border radius as needed
                  color: const Color.fromRGBO(245, 245, 245, 1),
                ),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (value) {
                    userPhoneNumber = value.phoneNumber!;
                  },
                  initialValue:
                      PhoneNumber(isoCode: isoCode, dialCode: countryCode),
                  keyboardType: TextInputType.phone,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Poppins',
                  ),
                  cursorColor: const Color.fromRGBO(15, 13, 35, 1),
                  inputBorder: const OutlineInputBorder(),
                  inputDecoration: const InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(2, 6, 20, 1),
                    ),
                    border: InputBorder.none, // Set input border to none to avoid duplication
                  ),
                ),
              ),

              const SizedBox(height: 16.0),
              TextFormField(
                decoration: kinputBorderDecoration('Email ID'),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      showCursor: false,
                      autofocus: true,
                      decoration: kinputBorderDecoration('State'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      decoration: kinputBorderDecoration('District'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: kinputBorderDecoration('Pin Code'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      decoration: kinputBorderDecoration('Admin ID'),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color:const Color.fromARGB(255, 255, 255, 255),
        child: RoundedButton2(
          colour: const Color.fromRGBO(255, 255, 255, 1),
          onPressed: () {
            // Navigator.of(context).pushNamed("phone_number");
            Navigator.pop(context);
          },
          title: 'Next',
          border:const Color.fromRGBO(16, 13, 64, 1),
          textColor:const Color.fromRGBO(16, 13, 64, 1),
        ),
      ),
    );
  }
}







