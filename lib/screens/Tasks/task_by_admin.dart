import 'package:ca/components/admin/services_list.dart';
import 'package:ca/models/registration_type_model.dart';
import 'package:ca/theme/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskByAdminScreen extends StatefulWidget {
  static const String id = 'task_by_admin';
  const TaskByAdminScreen({Key? key}) : super(key: key);

  @override
  TaskByAdminScreenState createState() => TaskByAdminScreenState();
}

class TaskByAdminScreenState extends State<TaskByAdminScreen> {
  RegistrationType? selectedService;
  List<String> clients = [
    'Divyanshu Kumar Kushwaha',
    'Client 2',
    'Client 3',
    'Client 4',
    'Client 5',
    'Client 6',
  ];
  void handleServiceSelection(RegistrationType service) {
    setState(() {
      selectedService = service;
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
    final themeprovider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Task By Admin',
            style: TextStyle(color: themeprovider.getPrimaryColor)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: themeprovider.getPurpleTextColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        
      ),
      body: Column(
        children: [
          ServiceList(
            onServiceSelected: handleServiceSelection,
            selectedRegType: selectedService!,
          ),
          const SizedBox(height: 10.0,),
          Expanded(
            child: ListView.builder(
              itemCount: filteredClients.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 0.3,
                  margin:const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color.fromRGBO(236, 231, 255, 1),
                      radius: 50,
                      child: Icon(
                        Icons.person,
                        color: Color.fromRGBO(16, 13, 64, 1),
                      ),
                    ),
                    title: Text(
                      filteredClients[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      '#Client 673',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      // Handle client item tap
                      // print("Selected client: ${filteredClients[index]}");
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => AdminProfileScreen()),
                      // );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}

