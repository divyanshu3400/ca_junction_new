import 'package:ca/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/daytheme.dart';

class Pay_Admin extends StatefulWidget {
  const Pay_Admin({Key? key}) : super(key: key);

  @override
  State<Pay_Admin> createState() => _Pay_AdminState();
}

class _Pay_AdminState extends State<Pay_Admin> {
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
          title: Text(
              'Pay Your Admin',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'Poppins'
              )),
          centerTitle: true,
          toolbarHeight: 80.0,
        ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            TextFormField(
              cursorColor: AppColors.mutedTextColor,
              decoration: InputDecoration(
                labelText: 'Reason of Payment',
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(2, 6, 20, 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(15, 13, 35, 1), width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              cursorColor: AppColors.mutedTextColor,
              decoration: InputDecoration(
                labelText: 'Pay Amount',
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(2, 6, 20, 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(15, 13, 35, 1), width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              cursorColor: AppColors.mutedTextColor,
              decoration: InputDecoration(
                suffixIcon: Image(image: AssetImage('assets/images/Calendar.png'),),
                labelText: 'Date',
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(2, 6, 20, 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(15, 13, 35, 1), width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              cursorColor: AppColors.mutedTextColor,
              decoration: InputDecoration(
                labelText: 'Payment Method',
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(2, 6, 20, 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(15, 13, 35, 1), width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
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
            child: RoundedButton(colour: Colors.white, border: Color.fromRGBO(16, 13, 64, 1), title: 'SUBMIT', onPressed: (){}, textColor: Color.fromRGBO(16, 13, 64, 1),),
          ),
        ),
      ],
    );

  }
}
