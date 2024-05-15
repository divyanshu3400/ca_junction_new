import 'package:ca/components/rounded_button.dart';
import 'package:ca/core/router/routers.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:ca/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountCreatedScreen extends StatelessWidget {
  const AccountCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(height: 194.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children:  [
                Text(
                  'Account Created',
                  style: kTitleTextColor(context),
                ),
                const SizedBox(height: 15.0),
                Text(
                  'Your account has been created successfully. Press continue to continue using the app',
                  textAlign: TextAlign.center,
                  style: kDescriptionColor(context),
                ),
                const SizedBox(height: 100.0,),
                const Image(
                  image: AssetImage('assets/images/Account Created.png')
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RoundedButton(
                    colour: const Color.fromRGBO(16, 13, 64, 1), 
                    onPressed: (){
                      context.go('/${Routers.home}');
                    },
                    title: 'Continue',
                    textColor: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  const SizedBox(height: 8.0,),
                  const Text(
                    'By clicking continue, you agree to our',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your Terms and Condition logic here
                    },
                    child: const Text(
                      "Terms and Conditions",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: 'Poppins',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                      
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10.0,),
        ],
      ),
    );
  }
}