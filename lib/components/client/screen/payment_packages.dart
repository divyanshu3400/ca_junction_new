import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Payment_Packages extends StatefulWidget {
  const Payment_Packages({super.key});

  @override
  State<Payment_Packages> createState() => _Payment_PackagesState();
}

class _Payment_PackagesState extends State<Payment_Packages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              // Add your back button functionality here
            },
          ),
        ),
        title: Text('Packages', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        toolbarHeight: 80.0,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          gridWithIcon("lumpsum", "On Turnover Basis", true),
          gridWithIcon("Individual Services Fees", "On Turnover Basis", false),
        ],
      ),
    );
  }
}


Widget gridWithIcon(String title, String subtitle, bool flag) {
  return Container(
    width: 160.sp,
    height: 150.h,
    padding: EdgeInsets.symmetric(horizontal: 10.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.0),
      color: flag
          ? const Color.fromARGB(75, 3, 168, 244)
          : const Color.fromARGB(124, 255, 235, 59),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                      image: flag
                          ? AssetImage('assets/images/is-approximately-equal-to_svgrepo.com.png')
                          : AssetImage('assets/images/individual_svgrepo.com.png')),
                  Icon(
                      Icons.more_vert,
                      color: flag ? Colors.blue : Colors.orange
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: flag ? Colors.blue : Colors.orange,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: flag ? Colors.blue : Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}








  