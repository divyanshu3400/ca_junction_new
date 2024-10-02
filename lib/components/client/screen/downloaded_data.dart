import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Downloaded_Data extends StatefulWidget {
  const Downloaded_Data({super.key});

  @override
  State<Downloaded_Data> createState() => _Downloaded_DataState();
}

class _Downloaded_DataState extends State<Downloaded_Data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 15.h) ,
          child: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              // Add your back button functionality here
            },
          ),
        ),
        title: Text('Downloaded Data', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle add button press
            },
          ),
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
        toolbarHeight: 80.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: GridB(),
            ),
          ),
        ],
      ),
    );
  }
}


class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Income Tax Return",
      "image": 'assets/images/income-tax-logo (1).png',
    },
    {
      "title": "Goods & Service Tax",
      "image": 'assets/images/GST-logo.png',
      
    },
    {
      "title": "Audit Reports Balance Sheets",
      "image": 'assets/images/Audit-logo.png',
    },
    {
      "title": "TDS/TCS",
      "image": 'assets/images/TDS-logo.png',
    },
    {
      "title": "FSSAI/License/Return",
      "image": 'assets/images/fssai-logo (1).png',
    },
    {
      "title": "MSME",
      "image": 'assets/images/MSME-logo.png',
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 120,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            color: Color.fromARGB(255, 220, 160, 231),
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
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage("${gridMap.elementAt(index)['image']}")),
                    SizedBox(height: 8,),
                    Text(
                      "${gridMap.elementAt(index)['title']}",
                      textAlign: TextAlign.center,

                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}