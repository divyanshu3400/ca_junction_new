import 'package:ca/theme/daytheme.dart';
import 'package:flutter/material.dart';

kOnboardingScreenTextColor(BuildContext context) {
  return const TextStyle(
    color: AppColors.primaryColor,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
  );
}

kTitleTextColor(BuildContext context) {
  Color textColor = AppColors.primaryColor;
  return TextStyle(
    color: textColor,
    fontFamily: "Poppins",
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
  );
}


kDescriptionColor(BuildContext context) {
  Color descriptionTextColor = AppColors.mutedTextColor;
  return TextStyle(
    color: descriptionTextColor,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
  );
}

// const kTextFieldDecoration = InputDecoration(
//   fillColor: Color.fromRGBO(247, 247, 247, 1), // Set your desired color here
//   filled: true,
//   border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//   ),
//   enabledBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Color.fromRGBO(196, 196, 196, 1), width: 1.0),
//     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//   ),
//   focusedBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Color.fromRGBO(15, 13, 35, 1), width: 2.0),
//     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//   ),
// );


InputDecoration kTextFieldDecoration(BuildContext context) {

  return const InputDecoration(
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.mutedTextColor, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  );
}

const String iSLOGGEDIN = 'isLoggedIn';
// const String BASE_URL = 'http://techsmms.com:9999/';
// const String BASE_URL = 'http://89.116.20.46:9999/';
const String BASE_URL = 'http://10.10.10.23:8000/';
const String userDataKey = 'userHiveData';
const String userBox = 'userBox';
const String userId = 'userId';
const String userDashboardStats = 'userDashboardStats';
const String token = 'token';
const String deviceId = 'deviceId';
const String userRole = 'userRole';
const String userEmail = 'userEmail';
