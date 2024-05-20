import 'package:ca/components/rounded_button.dart';
import 'package:ca/core/network_connectivity_check/network_connectivity_provider.dart';
import 'package:ca/core/network_connectivity_check/network_connectivity_state.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:ca/utility/constants.dart';
import 'package:ca/utility/shared_pref.dart';
import 'package:ca/utility/ui_utils.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/router/routers.dart';
import '../utility/api_request.dart';
import '../utility/custom_loader.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  bool passwordShow = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Future(() {
      ref.read(connectivityStatusProviders.notifier).checkStatus();
    });
    super.initState();

  }
  @override
  void dispose() {
    ref.read(connectivityStatusProviders.notifier).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final connectivity = ref.watch(connectivityStatusProviders);

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
                TextFormField(
                  controller: passwordController,
                  validator: Validators.isValidPassword,
                  decoration: InputDecoration(
                    labelText: 'Enter new password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
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
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: newPasswordController,
                  validator: Validators.isValidPassword,
                  decoration: InputDecoration(
                    labelText: 'Re-Enter new password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
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
                if (_formKey.currentState!.validate()) {
                  if (passwordController.text.toString().trim() ==
                      newPasswordController.text.toString().trim()) {
                    if (connectivity.connectivityStatus ==
                        ConnectivityStatus.isConnected) {
                      String email = SharedPref.getString(userEmail) ?? "";
                      Map<String, dynamic> data = {
                        "email": email,
                        "new_password": passwordController.text.toString(),
                        "confirm_password":
                            newPasswordController.text.toString().trim(),
                      };
                      setPassword(
                          'api/set-password/', data, 'Changing password...');
                    }
                  }
                  else{
                    setState(() {
                      context.showSnackbarMessage('Internet Required');
                    });
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
      String endpoint, Map<String, dynamic> data, String message) async {
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
