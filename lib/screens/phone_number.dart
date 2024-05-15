import 'package:ca/components/rounded_button.dart';
import 'package:ca/theme/mytheme.dart';
import 'package:ca/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});


  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumberScreen> {
  String countryCode = '+91';
  String isoCode = 'IN';
  late String userPhoneNumber;
  
  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeprovider.getBackgroundColor,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 194.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                Text(
                  'Your Phone Number',
                  style: kTitleTextColor(context),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Enter your mobile number to register an account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: themeprovider.getDescriptionColor,
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(15, 13, 35, 1),
                      width: 1.0,
                    ), // Customize border properties as needed
                    borderRadius: BorderRadius.circular(4), // Adjust border radius as needed
                    color: Color.fromRGBO(245, 245, 245, 1),
                  ),
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (value) {
                      userPhoneNumber = value.phoneNumber!;
                    },
                    
                    initialValue: PhoneNumber(isoCode: isoCode, dialCode:countryCode),
                    keyboardType: TextInputType.phone,
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                    ),
                    cursorColor: Color.fromRGBO(15, 13, 35, 1),
                    inputBorder: OutlineInputBorder(),
                    inputDecoration: InputDecoration(
                      border: InputBorder.none, // Set input border to none to avoid duplication
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RoundedButton(
                      colour: const Color.fromRGBO(16, 13, 64, 1), 
                      onPressed: (){
                        Navigator.of(context).pushNamed("verification_screen", arguments: userPhoneNumber);
                      }, 
                      title: 'Send Code',
                      textColor: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    RoundedButton(
                      colour: const Color.fromRGBO(255, 255, 255, 1), 
                      onPressed: (){
                        //
                      }, 
                      title: 'Sign Up With Email',
                      border: Color.fromRGBO(16, 13, 64, 1),
                      textColor: Color.fromRGBO(16, 13, 64, 1),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0,),
        ],
      ),
    );
  }
}


