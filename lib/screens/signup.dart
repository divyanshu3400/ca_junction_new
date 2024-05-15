import 'package:ca/components/rounded_button.dart';
import 'package:ca/core/router/routers.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:ca/utility/shared_pref.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constant/text_style.dart';
import '../input_form_field.dart';
import '../utility/api_request.dart';
import '../utility/constants.dart';
import 'dart:math';
import '../utility/custom_loader.dart';
import '../utility/firebase_serv.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  bool passwordShow = true;
  bool _agreeToTerms = false;
  String? _deviceId;

  @override
  void initState() async{
    _deviceId = await FirebaseServ.getFCMToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 168.0),
              Text(
                'Welcome !',
                style: kTitleTextColor(context),
              ),
              const SizedBox(height: 40.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Full Name',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 7.0),
                      InputFormField(
                        borderRadius: BorderRadius.circular(10),
                        fillColor: const Color(0xfffafafa),
                        textEditingController: usernameController,
                        validator: Validators.isValidName,
                        hintTextStyle: AppTextStyle.textStyleOne(
                          const Color(0xffC4C5C4),
                          14,
                          FontWeight.w400,
                        ),
                        hintText: 'Enter your name',
                        borderType: BorderType.none,
                      ),
                      const SizedBox(height: 10.0),

                      // Email Address field
                      const Text(
                        'Email Address',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 7.0),
                      InputFormField(
                        borderRadius: BorderRadius.circular(10),
                        fillColor: const Color(0xfffafafa),
                        textEditingController: emailController,
                        validator: Validators.isValidEmail,
                        hintTextStyle: AppTextStyle.textStyleOne(
                          const Color(0xffC4C5C4),
                          14,
                          FontWeight.w400,
                        ),
                        hintText: 'Enter your Email Address',
                        borderType: BorderType.none,
                      ),
                      const SizedBox(height: 10.0),

                      // Password field
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 7.0),
                      InputFormField(
                        borderRadius: BorderRadius.circular(10),
                        fillColor: const Color(0xfffafafa),
                        password: EnabledPassword(),
                        obscuringCharacter: '*',
                        validator: Validators.isValidPassword,
                        hintTextStyle: AppTextStyle.textStyleOne(
                          const Color(0xffC4C5C4),
                          14,
                          FontWeight.w400,
                        ),
                        hintText: 'Enter Account Password',
                        borderType: BorderType.none,
                        textEditingController: passwordController,
                      ),
                      const SizedBox(height: 7.0),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 7.0),
                      InputFormField(
                        borderRadius: BorderRadius.circular(10),
                        fillColor: const Color(0xfffafafa),
                        password: EnabledPassword(),
                        obscuringCharacter: '*',
                        validator: Validators.isValidPassword,
                        hintTextStyle: AppTextStyle.textStyleOne(
                          const Color(0xffC4C5C4), 14, FontWeight.w400,),
                        hintText: 'Confirm Password',
                        borderType: BorderType.none,
                        textEditingController: passwordController2,
                      ),
                      const SizedBox(height: 10.0),

                      // Terms and conditions checkbox
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return AppColors.mutedTextColor;
                              }
                              return AppColors.white;
                            }),
                            checkColor: const Color.fromRGBO(16, 13, 64, 1),
                            value: _agreeToTerms,
                            onChanged: (newValue) {
                              setState(() {
                                _agreeToTerms = newValue!;
                              });
                            },
                          ),
                          const Text(
                            'I agree to our Terms and Conditions',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontFamily: 'Poppins',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),

                      RoundedButton(
                        colour: const Color.fromRGBO(16, 13, 64, 1),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              barrierDismissible: false, // Prevent user from dismissing dialog
                              builder: (BuildContext context) {
                                return const CustomLoaderDialog(message: 'Creating Account. Don\'t exit..');
                              },
                            );
                            _handleSubmit();
                          }
                        },
                        title: 'Sign Up',
                        textColor: const Color.fromRGBO(255, 255, 255, 1),
                      ),

                      // Sign Up with Phone Number button
                      RoundedButton(
                        colour: const Color.fromRGBO(255, 255, 255, 1),
                        onPressed: () {
                          context.go('/${Routers.phoneSignUp}');
                        },
                        title: 'With Phone Number',
                        border: AppColors.primaryColor,
                        textColor: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              // Already have an account? Sign In button

            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Already have an account ?',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
            ),
          ),
          TextButton(
            onPressed: () {

              context.go('/${Routers.signIn}');
            },
            child: const Text(
              "Sign In",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _handleSubmit() async {
    var fullName = usernameController.text.toString().trim();
    var userEmail = emailController.text.toString().trim();
    var userPass = passwordController.text.toString().trim();
    var userPass2 = passwordController2.text.toString().trim();
    var random = Random();
    var randomNumber = random.nextInt(9000) + 1000;
    List<String> nameParts = fullName.split(' ');
    var firstName = nameParts[0];
    var lastName = nameParts.sublist(1).join(' ');
    firstName = firstName.trim();
    lastName = lastName.trim();
    Map<String, String> formData = {
      'username': '$firstName$randomNumber',
      'first_name': firstName,
      'last_name': lastName,
      'email': userEmail,
      'password': userPass,
      'password2': userPass2,
      'device_id': _deviceId!,
    };
    var response = await postRequest('api/create-user', formData);
    setState(() {
      Navigator.pop(context);
      if (response != null && response['status'] == 201) {
        SharedPref.storeBool(iSLOGGEDIN, true);
        SharedPref.storeInt(userId, response['data']['id']);
        SharedPref.storeString(token, response['token']);
        context.pushReplacement('/${Routers.welcomeScreen}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${response['message']}')),
        );
      } else if (response != null && response['status'] == 400) {
        var errorMessage = response['message'];
        if (errorMessage is Map && errorMessage.containsKey('password')) {
          errorMessage = errorMessage['password'];
        }
        else if (errorMessage is Map && errorMessage.containsKey('username')) {
          errorMessage = errorMessage['username'];
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage.toString())),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error, Try again')),
        );
      }
    });

  }
}
