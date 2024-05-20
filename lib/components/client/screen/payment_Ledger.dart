import 'package:ca/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/daytheme.dart';

class Payment_Legder extends StatefulWidget {
  const Payment_Legder({Key? key}) : super(key: key);

  @override
  State<Payment_Legder> createState() => _Payment_LegderState();
}

class _Payment_LegderState extends State<Payment_Legder> {

  final List<Map<String, dynamic>> mapi = [
    {
      "title": 'Present Finanical Year',
      'value': false,
    },
    {
      "title": 'Present Finanical Year',
      'value': false,
    },
    {
      "title": 'Present Finanical Year',
      'value': false,
    }
  ];

  // final TextEditingController _textController = TextEditingController();
  bool _isExpanded = false;
  // void _updateTextField(String title) {
  //   setState(() {
  //     _textController.text = title;
  //     _isExpanded = false; // Collapse the ExpansionTile
  //   });
  // }



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
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ExpansionTile(
                initiallyExpanded: _isExpanded,
                // onExpansionChanged: (bool expanded) {
                //   setState(() {
                //     _isExpanded = expanded;
                //   });
                // },
                title: Text('Select'),
                children: mapi.map((item) {
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return CheckboxListTile(
                        title: Text(item['title']),
                        value: item['value'],
                        onChanged: (bool? value) {
                          // setState(() {
                          //   // Uncheck all checkboxes first
                          //   for (var mapItem in mapi) {
                          //     mapItem['value'] = false;
                          //   }
                          //   // Check the selected checkbox
                          //   item['value'] = value;
                          //   if (value == true) {
                          //     _updateTextField(item['title']);
                          //   }
                          // });
                          setState((){
                            item['value'] = value;
                            print(value);
                            _isExpanded = !_isExpanded;
                            print(_isExpanded);
                          });

                        },
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: AppColors.mutedTextColor,
                    decoration: InputDecoration(
                      suffixIcon: Image(image: AssetImage('assets/images/Calendar.png'),),
                      labelText: 'Start Date',
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
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: TextFormField(
                    cursorColor: AppColors.mutedTextColor,
                    decoration: InputDecoration(
                      suffixIcon: Image(image: AssetImage('assets/images/Calendar.png'),),
                      labelText: 'Start Date',
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
                ),
              ],
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
