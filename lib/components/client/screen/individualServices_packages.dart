import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndividualServices_Package extends StatefulWidget {
  const IndividualServices_Package({Key? key}) : super(key: key);

  @override
  State<IndividualServices_Package> createState() =>
      _IndividualServices_PackageState();
}

class _IndividualServices_PackageState
    extends State<IndividualServices_Package> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        title: Text('Individual Services Fees',
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
        toolbarHeight: 80.0,
      ),
      body: Card(
        elevation: 3.0,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(10.h),
          margin: EdgeInsets.all(20.h),
          height: 200.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Individual Services Fees'),
              SizedBox(
                height: 5.h,
              ),
              Divider(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0-50 Lakhs',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            print('pressed');
                          },
                          child: Text('Chart')),
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        GestureDetector(
          onTap: () {
            print('okk');
          },
          child: Container(
            padding: EdgeInsets.all(5),
            width: double.infinity,
            height: 50.h,
            // color: Colors.red,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image(
                    image: AssetImage('assets/images/Rectangle-DottedButton.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Colors.black),
                      SizedBox(width: 8.0),
                      // Adjust the spacing between the icon and text
                      Text(
                        'Create Your Own Package',
                        style: TextStyle(
                          color: Colors.black, // Adjust the text color as needed
                          fontSize: 16.0, // Adjust the font size as needed
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
