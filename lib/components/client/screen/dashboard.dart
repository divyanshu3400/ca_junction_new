import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ClientDashboardScreen extends StatefulWidget {
  const ClientDashboardScreen({super.key});

  @override
  State<ClientDashboardScreen> createState() => _ClientDashboardScreenState();
}

class _ClientDashboardScreenState extends State<ClientDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        title: Text('My Profile', style: TextStyle(color: Colors.black)),
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  height: 250,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.account_circle,
                                size: 50.0,
                              ),
                            ),
                          ),
                          Container(
                            height: 25,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Center(
                                child: Text(
                              '#562',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                          ),
                        ],
                      ),
                      Text(
                        'Neelesh Mishra',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      Text(
                        'M/S R.D. Traders',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      
                      GridCheckbox(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'My Folders',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  gridWithIcon('Downloaded Data', 'Income Tax, FSSAI', true),
                  gridWithIcon('Uploaded Data', 'FSSAI, MSSM', false),
                ],
              ),
              SizedBox(height: 10),
              GridB(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Recent Uploads',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 50,
                      ),
                      title: Text(
                        'GST FY 2022-23',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'November 2023',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      trailing: Text('300 kb'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget gridWithIcon(String title, String subtitle, bool flag) {
  return Container(
    width: 183,
    height: 130,
    padding: const EdgeInsets.all(5),
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                      image: flag
                          ? AssetImage('assets/images/Folder-Blue.png')
                          : AssetImage('assets/images/Folder-Yellow.png')),
                  Icon(Icons.more_vert),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
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

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Assign Tasks to Admin",
    },
    {
      "title": "Tasks By Admin",
    },
    {
      "title": "Pay Your Admin",
    },
    {
      "title": "Payment Ledger",
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
        mainAxisExtent: 100,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Container(
          width: 148,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            color: Color.fromARGB(113, 237, 36, 22),
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${gridMap.elementAt(index)['title']}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.merge(
                            const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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






class GridCheckbox extends StatefulWidget {
  const GridCheckbox({Key? key}) : super(key: key);

  @override
  State<GridCheckbox> createState() => _GridCheckboxState();
}

class _GridCheckboxState extends State<GridCheckbox> {
  List<Map<String, dynamic>> gridMap = [
    {
      'checkbox': Checkbox(
        value: false,
        onChanged: (value) {},
      ),
      "title": "GST",
    },
    {
      'checkbox': Checkbox(
        value: false,
        onChanged: (value) {},
      ),
      "title": "Income",
    },
    {
      'checkbox': Checkbox(
        value: false,
        onChanged: (value) {},
      ),
      "title": "FSSAI",
    },
    {
      'checkbox': Checkbox(
        value: false,
        onChanged: (value) {},
      ),
      "title": "MSME",
    },
    {
      'checkbox': Checkbox(
        
        value: false,
        onChanged: (value) {},
      ),
      "title": "DSC",
    },
    {
      'checkbox': Checkbox(
        value: false,
        onChanged: (value) {},
      ),
      "title": "TDS/TCS",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 3.0,
        mainAxisExtent: 50,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                gridMap.elementAt(index)['checkbox'],
                Text("${gridMap.elementAt(index)['title']}"),
              ],
            ),
          ],
        );
      },
    );
  }
}