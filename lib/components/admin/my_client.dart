import 'package:ca/components/admin/riverpod/client_riverpod.dart';
import 'package:ca/components/admin/services_list.dart';
import 'package:ca/core/router/routers.dart';
import 'package:ca/models/client_model.dart';
import 'package:ca/models/registration_type_model.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class MyClientScreen extends ConsumerStatefulWidget {
  const MyClientScreen({Key? key}) : super(key: key);

  @override
  MyClientScreenState createState() => MyClientScreenState();
}

class MyClientScreenState extends ConsumerState<MyClientScreen> {
  RegistrationType? selectedService;
  List<ClientModel> clients = [];
  List<ClientModel> filteredClients = [];
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Clients"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '(${clients.length})',
              style: const TextStyle(fontSize: 16, color: AppColors.mutedTextColor),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ServiceList(
            onServiceSelected: handleServiceSelection,
            selectedRegType: selectedService,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Clients',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                    color: Colors.grey[100]!,
                  ),
                ),
                suffixIcon: const Icon(Icons.search),
              ),
              onChanged: handleSearch,
            ),
          ),
          Expanded(
            child: Consumer(
              builder: (context, watch, child) {
                final clientsAsyncValue = ref.watch(clientsProvider);
                return clientsAsyncValue.when(
                  loading: () =>const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => Center(child: Text('Error: $error')),
                  data: (data) {
                    clients = data;
                    filteredClients = selectedService == null || selectedService!.type?.toLowerCase() == 'all'
                        ? clients
                        : clients.where((client) => client.getClientData()!.registrationTypes.contains(selectedService!.id)).toList();

                    if (query.isNotEmpty) {
                      filteredClients = filteredClients.where((client) =>
                      client.firstName.toLowerCase().contains(query.toLowerCase()) ||
                          client.lastName.toLowerCase().contains(query.toLowerCase()) ||
                          client.username.toLowerCase().contains(query.toLowerCase())).toList();
                    }

                    return filteredClients.isEmpty ?
                    Center(child: Text('No clients available for the $selectedService'))
                    :ListView.builder(
                      itemCount: filteredClients.length,
                      itemBuilder: (BuildContext context, int index) {
                        final client = filteredClients[index];
                        return Card(
                          elevation: 0.3,
                          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: ListTile(
                            leading: const CircleAvatar(
                              radius: 50,
                              child: Icon(Icons.person),
                            ),
                            title: Text(
                              '${client.firstName} ${client.lastName}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '#Client ${client.username}',
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              context.push('/${Routers.clientProfile}/${client.id}');
                              HapticFeedback.mediumImpact();
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/${Routers.addClient}');
        },
        backgroundColor: AppColors.iconBackgroundColor,
        child: const Icon(Icons.person_add),
      ),
    );
  }

  void handleServiceSelection(RegistrationType service) {
    setState(() {
      selectedService = service;
    });
  }

  void handleSearch(String value) {
    setState(() {
      query = value;
    });
  }
}
