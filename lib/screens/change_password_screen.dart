import 'package:ca/components/rounded_button.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:ca/utility/constants.dart';
import 'package:ca/utility/shared_pref.dart';
import 'package:ca/utility/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/router/routers.dart';
import '../utility/api_request.dart';
import '../utility/custom_loader.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool passwordShow = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          // color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 70), // Adjust height as needed
                const Text(
                  'Change Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 162), // Adjust height as needed
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Enter new password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                ),
                const SizedBox(height: 30,),
                TextField(
                  controller: newPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Re-Enter new password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        Column(
          children: [
            RoundedButton(
              colour: AppColors.primaryColor,
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  if(passwordController.text.toString().trim()==newPasswordController.text.toString().trim())
                    {
                      String email = SharedPref.getString(userEmail) ?? "";
                      Map<String,dynamic> data = {
                        "email":email,
                        "new_password":passwordController.text.toString(),
                        "confirm_password":newPasswordController.text.toString().trim(),
                      };
                      setPassword('api/set-password/',data,'Changing password...');
                    }
                }
              },
              title: 'Save',
              textColor: AppColors.white,
            ),
            const SizedBox(height: 10),
            RoundedButton(
              colour: AppColors.white,
              onPressed: () {
                dispose();
              },
              title: 'Cancel',
              border: AppColors.primaryColor,
              textColor: AppColors.primaryColor,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ],
    );
  }

  Future<void> setPassword(
      String endpoint, Map<String, dynamic> data,String message) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomLoaderDialog(message: message);
      },
    );
    dynamic response = await makePostRequest(endpoint, data);
    setState(() {
      Navigator.pop(context);
      context.showSnackbarMessage(response['message']);
    });
    if (response['status'] == 200) {
      setState(() {
        SharedPref.remove(userEmail);
        context.pushReplacement('/${Routers.signIn}');
      });
    }
  }
}
