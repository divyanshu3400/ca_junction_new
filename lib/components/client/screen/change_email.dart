import 'package:ca/components/rounded_button.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/daytheme.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 15.h),
          child: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              // Add your back button functionality here
            },
          ),
        ),
        title: Text('Change Email',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'Poppins')),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle add button press
            },
          ),
        ],
        centerTitle: true,
        toolbarHeight: 80.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Email',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              cursorColor: AppColors.mutedTextColor,
              validator: Validators.isValidEmail,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(2, 6, 20, 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(15, 13, 35, 1), width: 1.0),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'New Email',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              cursorColor: AppColors.mutedTextColor,
              validator: Validators.isValidEmail,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(2, 6, 20, 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(15, 13, 35, 1), width: 1.0),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
                'Enter Your Email Password',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins'
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              cursorColor: AppColors.mutedTextColor,
              obscureText: isHidden,
              validator: Validators.isValidPassword,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  child: Icon(
                    isHidden ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(2, 6, 20, 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(15, 13, 35, 1), width: 1.0),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        GestureDetector(
          onTap: () {
            print('okk');
          },
          child: Padding(
            padding: EdgeInsets.all(5),
            child: RoundedButton(
              colour: const Color.fromRGBO(16, 13, 64, 1),
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   showDialog(
                //     context: context,
                //     barrierDismissible: false, // Prevent user from dismissing dialog
                //     builder: (BuildContext context) {
                //       return const CustomLoaderDialog(message: 'Creating Account. Don\'t exit..');
                //     },
                //   );
                //   _handleSubmit();
                // }
              },
              title: 'Save Email',
              textColor: const Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
        ),
      ],
    );
  }
}
