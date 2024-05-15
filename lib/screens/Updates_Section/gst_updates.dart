import 'package:ca/components/admin/services_list.dart';
import 'package:ca/models/registration_type_model.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:flutter/material.dart';

class GstUpdatesScreen extends StatefulWidget {
  static const String id = 'gst_updates';

  const GstUpdatesScreen({Key? key}) : super(key: key);

  @override
  GstUpdatesScreenState createState() => GstUpdatesScreenState();
}

class GstUpdatesScreenState extends State<GstUpdatesScreen> {
  int _selectedIndex = 0;

  RegistrationType? selectedService ;
  List<String> clients = [
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  ];
  void handleServiceSelection(RegistrationType service) {
    setState(() {
      selectedService = service;
      print("Selected Service is: ${service}");

    });
  }

  List<String> filteredClients = [];

  @override
  void initState() {
    super.initState();
    filteredClients.addAll(clients);
  }

  void filterClients(String query) {
    filteredClients.clear();
    if (query.isEmpty) {
      filteredClients.addAll(clients);
    } else {
      for (var client in clients) {
        if (client.toLowerCase().contains(query.toLowerCase())) {
          filteredClients.add(client);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:const Text('Updates',
            style: TextStyle(color: AppColors.primaryColor)),
        leading: IconButton(
          icon:const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          ServiceList(
            onServiceSelected: handleServiceSelection, selectedRegType: selectedService!,
          ),

          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredClients.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 0.3,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text(
                      filteredClients[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: const Text(
                      '13 Oct 2021',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    // trailing: const Icon(
                    //   Icons.keyboard_arrow_down,
                    //   color: Colors.grey,
                    // ),
                    onTap: () {

                      setState(() {
                        _showBottomSheet(context, clients[index]);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          // Bottom navigation bar
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, clients) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => SingleChildScrollView(
        // return Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisSize: MainAxisSize.min,
          // children: <Widget>[
          //   ListTile(
          //     title: const Text(
          //       'Move to Dropbox',
          //       textAlign: TextAlign.center,
          //     ),
          //     onTap: () {
          //       // Handle edit action
          //       Navigator.pop(context);
          //     },
          //   ),
          // ],
        // );

        child: Container(
          color:const Color(0xff757575),
          child: Container(
              padding:const EdgeInsets.all(20.0),
              decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    title: const Text(
                      'Move to Dropbox',
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      // Handle edit action
                      Navigator.pop(context);
                    },
                  ),
                ],
              )),
        ),
      )
    );
  }

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
