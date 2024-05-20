import 'dart:async';
import 'package:ca/core/network_connectivity_check/network_connectivity_state.dart';
import 'package:ca/core/router/routers.dart';
import 'package:ca/utility/constants.dart';
import 'package:ca/utility/shared_pref.dart';
import 'package:ca/utility/ui_utils.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../components/rounded_button.dart';
import '../core/network_connectivity_check/network_connectivity_provider.dart';
import '../theme/daytheme.dart';
import '../utility/api_request.dart';
import '../utility/custom_loader.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _SendEmailOTPState();
}

class _SendEmailOTPState extends ConsumerState<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isOTPReceived = false;
  int _timerCountdown = 300; // 5 minutes in seconds
  String _formattedTime = '';
  bool _isTimerRunning = false;

  void startTimer() {
    setState(() {
      _isTimerRunning = true;
    });
    const oneSecond = Duration(seconds: 1);
    Timer.periodic(oneSecond, (timer) {
      if (_timerCountdown == 0) {
        timer.cancel();
        setState(() {
          _isTimerRunning = false;
        });
      } else {
        int minutes = (_timerCountdown ~/ 60);
        int seconds = _timerCountdown % 60;
        setState(() {
          _timerCountdown--;
          _formattedTime = '$minutes:${seconds.toString().padLeft(2, '0')}';
        });
      }
    });
  }

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
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/Forget Password.png',
                    width: 250, height: 250),
                const SizedBox(height: 20),
                const Text(
                  'Enter your registered email below to receive password reset instruction',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.mutedTextColor,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: Validators.isValidEmail,
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                if (isOTPReceived)
                  TextFormField(
                    validator: Validators.inValidOTP,
                    controller: otpController,
                    decoration: const InputDecoration(
                      labelText: 'OTP',
                      border: OutlineInputBorder(),
                    ),
                  ),
                const SizedBox(height: 20),
                if (isOTPReceived)
                  Center(
                    child: _isTimerRunning
                        ? Text(
                            '$_formattedTime seconds left to resend OTP',
                            style: const TextStyle(fontSize: 16),
                          )
                        : TextButton(
                            onPressed: () {
                              String email = emailController.text.toString().trim();
                              Map<String, dynamic> data = {
                                'email': email,
                              };
                              sendOTP('api/send-email-otp/', data,'Sending OTP...');
                            },
                            child: const Text("Resend OTP")),
                  ),
                const SizedBox(
                  height: 20,
                ),
                RoundedButton(
                  colour: AppColors.primaryColor,
                  onPressed: () {
                    String email = emailController.text.toString().trim();
                    String otp = otpController.text.toString().trim();
                    if (_formKey.currentState!.validate()) {
                      if(connectivity.connectivityStatus == ConnectivityStatus.isConnected){
                        if (isOTPReceived) {
                          Map<String, dynamic> data = {
                            'email': email,
                            'otp': otp,
                          };
                          verifyOTP('api/verify-email-otp/', data,"Verifying OTP...");
                        } else {
                          Map<String, dynamic> data = {
                            'email': email,
                          };
                          sendOTP('api/send-email-otp/', data,"Sending OTP...");
                        }
                      }
                      else{
                        context.showSnackbarMessage('Internet Required');
                      }
                    }
                  },
                  title:
                      isOTPReceived ? 'Verify Code' : 'Send Verification Code',
                  textColor: AppColors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> sendOTP(
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
      startTimer();
      isOTPReceived = true;
      Navigator.pop(context);
      context.showSnackbarMessage(response['message']);
    });
    if (response['status'] == 200) {
      setState(() {
        SharedPref.storeString(userEmail, data['email']);
      });
    } else {
      isOTPReceived = false;
    }
  }

  Future<void> verifyOTP(
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
      startTimer();
      isOTPReceived = true;
      Navigator.pop(context);
      context.showSnackbarMessage(response['message']);
    });
    if (response['status'] == 200) {
      setState(() {
        context.push('/${Routers.updateNewPassword}');
      });
    } else {
      otpController.text = "";
      isOTPReceived = false;
    }
  }
}
