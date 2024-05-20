import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icon.dart';

class Ledger extends StatefulWidget {
  const Ledger({Key? key}) : super(key: key);

  @override
  State<Ledger> createState() => _LedgerState();
}

class _LedgerState extends State<Ledger> {

  final String month = 'July - 3033';
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
        title: Text('Pay Your Admin',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'Poppins')),
        centerTitle: true,
        toolbarHeight: 80.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
          children: [
            Center(child: Text('Month of')),
            Center(child: Text(month)),
            SizedBox(height: 10.0,),
            Container(
              height: 200,
              width: double.infinity,
              // margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0), // Border radius
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            cardBuilder('Demand', '3999', '3/43/4343'),
            cardBuilder('Demand', '3999', '3/43/4343'),
            cardBuilder('Demand', '3999', '3/43/4343'),
          ],
        ),
      ),
    );
  }

  Card cardBuilder(String title, String amount, String date) {

    return Card(
      elevation: 3.0,
      color: Colors.white,
      child: ListTile(
        leading: Text(
          title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              amount,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            Text(
              date,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
