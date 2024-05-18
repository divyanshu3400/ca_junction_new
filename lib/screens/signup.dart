import 'package:ca/components/rounded_button.dart';
import 'package:ca/core/network_connectivity_check/network_connectivity_state.dart';
import 'package:ca/core/router/routers.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:ca/utility/shared_pref.dart';
import 'package:ca/utility/ui_utils.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../core/constant/text_style.dart';
import '../core/network_connectivity_check/network_connectivity_provider.dart';
import '../input_form_field.dart';
import '../models/role_model.dart';
import '../riverpod/role_provider.dart';
import '../utility/api_request.dart';
import '../utility/constants.dart';
import 'dart:math';
import '../utility/custom_loader.dart';
import '../utility/dropdown.dart';
import '../utility/firebase_serv.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  bool passwordShow = true;
  bool _agreeToTerms = false;
  String? _deviceId;
  Role? selectedRole;

  @override
  void initState() {
    Future(() {
      ref.read(connectivityStatusProviders.notifier).checkStatus();
    });
    super.initState();
    getDeviceId();

  }
  @override
  void dispose() {
    ref.read(connectivityStatusProviders.notifier).dispose();
    super.dispose();
  }


  Future<void> getDeviceId() async {
    String? deviceId = await FirebaseServ.getFCMToken();
    setState(() {
      _deviceId = deviceId;
    });
  }
  @override
  Widget build(BuildContext context) {
    final rolesAsyncValue = ref.watch(rolesProvider);
    final connectivity = ref.watch(connectivityStatusProviders);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 70.h),
              Text(
                'Welcome !',
                style: kTitleTextColor(context),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      rolesAsyncValue.when(
                        data: (districtsList) {
                          return DropdownFormField<Role>(
                            onEmptyActionPressed: (dynamic obj) async {},
                            dropdownItemSeparator: const Divider(
                              color: Colors.black,
                              height: 1,
                            ),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.arrow_drop_down),
                                labelText: "Create account as"),
                            onSaved: (dynamic item) {
                              // Handle saved member
                            },
                            onChanged: (dynamic item) {
                              selectedRole = item;
                            },
                            validator: (dynamic value) {
                              if (selectedRole == null) {
                                setState(() {
                                  context.showSnackbarMessage(
                                      "Please Select dropdown value");
                                });
                              }
                              return null;
                            },
                            // Add your validation logic if needed
                            displayItemFn: (dynamic item) => item != null
                                ? Text(item.role,
                              style: const TextStyle(fontSize: 16),
                            )
                                : const SizedBox(),
                            findFn: (String str) async => districtsList,
                            selectedFn: (dynamic item1, dynamic item2) {
                              return item1 == item2;
                            },
                            filterFn: (dynamic member, String str) {
                              final String name =
                              (member as Role).role.toString();
                              final String searchLowerCase = str.toLowerCase();
                              return name.contains(searchLowerCase);
                            },
                            dropdownItemFn: (dynamic item,
                                int position,
                                bool focused,
                                bool selected,
                                Function() onTap) =>
                                ListTile(
                                  title: Text('${item?.role}'),
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
                      ),
                      SizedBox(height: 20.h),
                      const Text(
                        'Full Name',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 7.h),
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
                      SizedBox(height: 10.h),

                      // Email Address field
                      const Text(
                        'Email Address',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 7.h),
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
                      SizedBox(height: 10.h),
                      // Password field
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 7.h),
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
                      SizedBox(height: 7.h),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 7.h),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Column(
          children: [
            RoundedButton(
              colour: const Color.fromRGBO(16, 13, 64, 1),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if(connectivity.connectivityStatus == ConnectivityStatus.isConnected){
                    if(selectedRole!=null){
                      showDialog(
                        context: context,
                        barrierDismissible: false, // Prevent user from dismissing dialog
                        builder: (BuildContext context) {
                          return const CustomLoaderDialog(message: 'Creating Account. Don\'t exit..');
                        },
                      );
                      _handleSubmit();
                    }
                  }
                  else{
                    context.showSnackbarMessage("Internet Required");
                  }

                }
              },
              title: 'Sign Up',
              textColor: const Color.fromRGBO(255, 255, 255, 1),
            ),
            RoundedButton(
              colour: const Color.fromRGBO(255, 255, 255, 1),
              onPressed: () {
                context.go('/${Routers.phoneSignUp}');
              },
              title: 'With Phone Number',
              border: AppColors.primaryColor,
              textColor: AppColors.primaryColor,
            ),
            Row(
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
          ],
        ),
      ],
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
      'role_code':selectedRole?.roleCode??""
    };
    var response = await postRequest('api/create-user', formData);
    setState(() {
      Navigator.pop(context);
      if (response != null && response['status'] == 201) {
        SharedPref.storeBool(iSLOGGEDIN, true);
        SharedPref.storeInt(userId, response['data']['id']);
        SharedPref.storeString(token, response['token']);
        SharedPref.storeString(userRole, response['data']['role']);
        context.pushReplacement('/${Routers.welcomeScreen}');
        context.showSnackbarMessage(response['message']);

      } else if (response != null && response['status'] == 400) {
        var errorMessage = response['message'];
        if (errorMessage is Map && errorMessage.containsKey('password')) {
          errorMessage = errorMessage['password'];
        }
        else if (errorMessage is Map && errorMessage.containsKey('username')) {
          errorMessage = errorMessage['username'];
        }
        context.showSnackbarMessage(errorMessage);
      } else {
        context.showSnackbarMessage("Error, Try again");
      }
    });

  }
}
