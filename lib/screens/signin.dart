import 'package:ca/components/rounded_button.dart';
import 'package:ca/core/router/routers.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:ca/utility/firebase_serv.dart';
import 'package:ca/utility/ui_utils.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../core/constant/text_style.dart';
import '../input_form_field.dart';
import '../utility/constants.dart';
import '../utility/custom_loader.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utility/shared_pref.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>(); // Declare _formKey here

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? _deviceId;
  bool passwordShow = true;

  @override
  void initState() {
    super.initState();
    getDeviceId();
  }

  Future<void> getDeviceId() async {
    String? deviceId = await FirebaseServ.getFCMToken();
    setState(() {
      _deviceId = deviceId;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(color: AppColors.white),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 288,
                  decoration: const BoxDecoration(color: Color(0xFF100D40)),
                ),
              ),
              Positioned(
                left: 0,
                top: 320,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                      key: _formKey, // Assign the key to the Form widget
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: Text(
                              'Welcome Back!',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            'Email',
                            style: AppTextStyle.smallTextTwo,
                          ),
                          SizedBox(height: 20.h),
                          InputFormField(
                            borderRadius: BorderRadius.circular(10),
                            fillColor: const Color(0xfffafafa),
                            textEditingController: emailController,
                            validator: Validators.isValidName,
                            hintTextStyle: AppTextStyle.textStyleOne(
                              const Color(0xffC4C5C4),
                              14,
                              FontWeight.w400,
                            ),
                            hintText: 'Enter your Email Address',
                            borderType: BorderType.none,
                          ),
                          SizedBox(height: 30.h),
                          const Text(
                            'Password',
                            style: AppTextStyle.smallTextTwo,
                          ),
                          SizedBox(height: 20.h),
                          InputFormField(
                            borderRadius: BorderRadius.circular(10),
                            fillColor: const Color(0xfffafafa),
                            password: EnabledPassword(),
                            obscuringCharacter: '*',
                            textEditingController: passwordController,
                            validator: Validators.isValidPassword,
                            hintTextStyle: AppTextStyle.textStyleOne(
                              const Color(0xffC4C5C4),
                              14,
                              FontWeight.w400,
                            ),
                            hintText: 'Enter Account Password',
                            borderType: BorderType.none,
                          ),
                          SizedBox(height: 70.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  context.pushReplacement('/${Routers.forgetPass}');
                                  // Navigator.of(context).pushNamed("forgotPassword_screen");
                                },
                                child: const Text(
                                  'Forgot Password ?',
                                  style: TextStyle(
                                    color: Color.fromRGBO(196, 196, 196, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15.0),
                          RoundedButton(
                            colour: const Color.fromRGBO(16, 13, 64, 1),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false, // Prevent user from dismissing dialog
                                  builder: (BuildContext context) {
                                    return const CustomLoaderDialog(message: 'Logging in...');
                                  },
                                );
                              authenticateUser();
                              }
                            },
                            title: 'Sign In',
                            textColor: const Color.fromRGBO(255, 255, 255, 1),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 24,
                top: 92,
                child: Text(
                  'CA Junction',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Positioned(
                left: 0,
                top: 146,
                child: Image(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  image: AssetImage('assets/images/Layer 3.png'),
                ),
              ),
              const Positioned(
                right: 0,
                top: 85.0,
                child: Image(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  image: AssetImage('assets/images/Layer 2.png'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have an account ?',
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
              color: AppColors.primaryColor,
            ),
          ),
          TextButton(
            onPressed: () {
              context.go('/${Routers.signUp}');
            },
            child: const Text(
              "Sign Up",
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
  Future<void> authenticateUser() async {
    String apiUrl = '${BASE_URL}api/authenticate/user/';
    final String email = emailController.text.toString().trim();
    final String password = passwordController.text.toString().trim();
    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode({
          "email": email,
          "password": password,
          "device_id":_deviceId,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      final responseData = json.decode(response.body);
      setState(() {
        Navigator.pop(context);
      });
      if (response.statusCode == 200) {
        setState(() {
          SharedPref.storeBool(iSLOGGEDIN, true);
          SharedPref.storeInt(userId, responseData['user_id']);
          SharedPref.storeString(token, responseData['token']);
          SharedPref.storeString(deviceId, responseData['device_id']);
          context.showSnackbarMessage(responseData['message']);
          context.go('/${Routers.home}');
        });
      } else {
        setState(() {
          context.showSnackbarMessage(responseData['message']);
        });
      }
    } catch (error) {
      setState(() {
        Navigator.pop(context);
      });
      throw error.toString();
    }
  }

}




