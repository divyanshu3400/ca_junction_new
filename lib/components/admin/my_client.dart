import 'package:ca/components/admin/riverpod/category_details_notifier.dart';
import 'package:ca/components/admin/riverpod/category_details_provider.dart';
import 'package:ca/components/admin/services_list.dart';
import 'package:ca/core/router/routers.dart';
import 'package:ca/models/registration_type_model.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../utility/base_state.dart';

class MyClientScreen extends ConsumerStatefulWidget {
  const MyClientScreen({Key? key}) : super(key: key);

  @override
  MyClientScreenState createState() => MyClientScreenState();
}

class MyClientScreenState extends ConsumerState<MyClientScreen>  {
  RegistrationType? selectedService;
  String query = '';

  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(clientFilteredNotifierProvider.notifier).fetchClientsFromAPI();
    });
  }
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(clientFilteredNotifierProvider.notifier);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Clients"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/${Routers.home}');
          },
        ),
      ),
      body: Column(
        children: [
          ServiceList(
            onServiceSelected: notifier.filterRegisteredTypeClients,
            selectedRegType: selectedService,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: TextFormField(
              controller: notifier.searchController,
              decoration: InputDecoration(
                hintText: 'Search Clients',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(color: Colors.grey[100]!),
                ),
                suffixIcon: const Icon(Icons.search),
              ),
              onChanged: (query) {
                notifier.searchClients(query);
              },
            ),
          ),
          Expanded(
            child: Consumer(
              builder: (context, watch, child) {
                final state = watch.watch(clientFilteredNotifierProvider);
                if (state.status == Status.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status == Status.error) {
                  return Center(child: Text('${state.message}'));
                } else if (state.status == Status.success) {
                  final clients = state.data ?? [];
                  return ListView.builder(
                    controller: notifier.scrollController,
                    itemCount: clients.length,
                    itemBuilder: (BuildContext context, int index) {
                      final client = clients[index];
                      return Card(
                        elevation: 0.3,
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 50,
                            child: Icon(Icons.person),
                          ),
                          title: Text(
                            '${client.firstName} ${client.lastName == "NA" ? "" : client.lastName}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '#Client ${client.username}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                          onTap: () {
                            context.push('/${Routers.clientProfile}/${client.id}');
                            HapticFeedback.mediumImpact();
                          },
                        ),
                      );
                    },
                  );
                }

                return Container();
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

  }
}
