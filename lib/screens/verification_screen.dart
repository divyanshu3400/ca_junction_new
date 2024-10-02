import 'package:ca/components/rounded_button.dart';
import 'package:ca/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../theme/mytheme.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {


  @override
  Widget build(BuildContext context) {
    final String phoneNumber = ModalRoute.of(context)!.settings.arguments as String;
    
    final themeprovider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeprovider.getBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 194.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children:  [
                Text(
                  'Verify Account',
                  style: kTitleTextColor(context),
                ),
                SizedBox(height: 15.0),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: themeprovider.getDescriptionColor, // Optionally set the color
                    ),
                    children: [
                      TextSpan(
                        text: 'Enter 4 digit code we have sent to ',
                      ),
                      TextSpan(
                        text: phoneNumber,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                OtpForm(),
                SizedBox(height: 30,),
                Text(
                  'Haven’t received verification code?',
                  style: kDescriptionColor(context),
                ),
                SizedBox(height: 15,),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Resend Code",
                    style: TextStyle(
                      color: themeprovider.getPurpleTextColor,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RoundedButton(
                      colour: const Color.fromRGBO(16, 13, 64, 1), 
                      onPressed: (){
                        Navigator.of(context).pushNamed("accontcreated_screen");
                      }, 
                      title: 'Verify Now',
                      textColor: Color.fromRGBO(255, 255, 255, 1),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0,),
        ],
      ),
    );
  }
}






// class OtpForm extends StatefulWidget {
//   @override
//   _OtpFormState createState() => _OtpFormState();
// }

// class _OtpFormState extends State<OtpForm> {
//   final FocusNode _firstFocusNode = FocusNode();
//   final FocusNode _secondFocusNode = FocusNode();
//   final FocusNode _thirdFocusNode = FocusNode();
//   final FocusNode _fourthFocusNode = FocusNode();

//   @override
//   void dispose() {
//     _firstFocusNode.dispose();
//     _secondFocusNode.dispose();
//     _thirdFocusNode.dispose();
//     _fourthFocusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeprovider = Provider.of<ThemeProvider>(context);
//     final textFieldColor = themeprovider.getPurpleTextColor;
//     return Form(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             height: 68,
//             width: 64,
//             child: TextField(
//               focusNode: _firstFocusNode,
//               onChanged: (value) {
//                 if (value.length == 1) {
//                   _secondFocusNode.requestFocus();
//                 }
//               },
//               style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                 color: textFieldColor,
//                 fontSize: 32,
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w400,
//               ),
//               decoration: InputDecoration(
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: themeprovider.getOtpFieldColor),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: themeprovider.getOtpFieldColor),
//                 ),
//               ),
//               cursorColor: themeprovider.getOtpFieldColor,
//               keyboardType: TextInputType.number,
//               textAlign: TextAlign.center,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(1),
//                 FilteringTextInputFormatter.digitsOnly,
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 68,
//             width: 64,
//             child: TextField(
//               focusNode: _secondFocusNode,
//               onChanged: (value) {
//                 if (value.length == 1) {
//                   _thirdFocusNode.requestFocus();
//                 }
//               },
//               style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                 color: textFieldColor,
//                 fontSize: 32,
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w400,
//               ),
//               decoration: InputDecoration(
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: themeprovider.getOtpFieldColor),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: themeprovider.getOtpFieldColor),
//                 ),
//               ),
//               cursorColor: themeprovider.getOtpFieldColor,
//               keyboardType: TextInputType.number,
//               textAlign: TextAlign.center,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(1),
//                 FilteringTextInputFormatter.digitsOnly,
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 68,
//             width: 64,
//             child: TextField(
//               focusNode: _thirdFocusNode,
//               onChanged: (value) {
//                 if (value.length == 1) {
//                   _fourthFocusNode.requestFocus();
//                 }
//               },
//               style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                 color: textFieldColor,
//                 fontSize: 32,
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w400,
//               ),
//               decoration: InputDecoration(
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: themeprovider.getOtpFieldColor),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: themeprovider.getOtpFieldColor),
//                 ),
//               ),
//               cursorColor: themeprovider.getOtpFieldColor,
//               keyboardType: TextInputType.number,
//               textAlign: TextAlign.center,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(1),
//                 FilteringTextInputFormatter.digitsOnly,
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 68,
//             width: 64,
//             child: TextField(
//               focusNode: _fourthFocusNode,
//               onChanged: (value) {
//                 if (value.length == 1) {
//                   _fourthFocusNode.unfocus();
//                 }
//               },
//               style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                 color: textFieldColor,
//                 fontSize: 32,
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w400,
//               ),
//               decoration: InputDecoration(
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: themeprovider.getOtpFieldColor),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: themeprovider.getOtpFieldColor),
//                 ),
//               ),
//               cursorColor: themeprovider.getOtpFieldColor,
//               keyboardType: TextInputType.number,
//               textAlign: TextAlign.center,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(1),
//                 FilteringTextInputFormatter.digitsOnly,
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final FocusNode _firstFocusNode = FocusNode();
  final FocusNode _secondFocusNode = FocusNode();
  final FocusNode _thirdFocusNode = FocusNode();
  final FocusNode _fourthFocusNode = FocusNode();

  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _focusNodes = [
      _firstFocusNode,
      _secondFocusNode,
      _thirdFocusNode,
      _fourthFocusNode,
    ];
  }

  @override
  void dispose() {
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    final textFieldColor = themeprovider.getPurpleTextColor;

    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          4,
          (index) => SizedBox(
            height: 68,
            width: 64,
            child: TextField(
              autofocus: true,
              focusNode: _focusNodes[index],
              onChanged: (value) {
                if (value.isEmpty) {
                  // Move focus to the previous text field if the current one is empty
                  if (index > 0) {
                    FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                  }
                } else if (value.length == 1) {
                  // Move focus to the next text field if a digit is entered
                  if (index < 3) {
                    FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                  } else {
                    // If last text field, remove focus to hide the keyboard
                    _focusNodes[index].unfocus();
                  }
                }
              },
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: themeprovider.getOtpFieldColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: themeprovider.getOtpFieldColor),
                ),
              ),
              cursorColor: themeprovider.getOtpFieldColor,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ),
      ),
    );
  }
}


