import 'package:ca/models/client_model.dart';
import 'package:ca/models/registration_type_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../api_services/api_services.dart';
import '../../../core/network_connectivity_check/network_connectivity_provider.dart';
import '../../../core/network_connectivity_check/network_connectivity_state.dart';
import '../../../database/database_service.dart';
import '../../../utility/base_state.dart';
import '../../../utility/constants.dart';
import '../../../utility/shared_pref.dart';

class ClientDataNotifier extends Notifier<BaseState<List<ClientModel>>> {
  List<ClientModel> allClients = [];
  List<ClientModel> filteredClients = [];
  final TextEditingController searchController = TextEditingController();
  final List<String> recentSearches = [];
  final ScrollController scrollController = ScrollController();
  int limitData = 5;

  @override
  BaseState<List<ClientModel>> build() {
    scrollController.addListener(_scrollListener);
    fetchClientsFromAPI(); // Fetch clients on initialization
    return BaseState<List<ClientModel>>();
  }

  Future<void> fetchClientsFromAPI() async {
    state = state.copyWith(status: Status.loading);
    final connectivityStatus = ref.read(connectivityStatusProviders);
    String? userToken = SharedPref.getString(token);
    try {
      List<ClientModel> clients = [];
      if (connectivityStatus.connectivityStatus == ConnectivityStatus.isConnected) {
        final List<dynamic> clientsData = await APIServices.fetchClients(userToken!);
        clients = clientsData.map((client) => ClientModel.fromJson(client)).toList();
        await DatabaseService.database.clientDao.deleteAllClients();
        await DatabaseService.database.clientDao.insertClients(clients);
      } else {
        clients = await DatabaseService.database.clientDao.findAllClients();
      }

      if (clients.isEmpty) {
        state = state.copyWith(status: Status.error, message: 'No clients available');
      } else {
        allClients = clients;
        state = state.copyWith(status: Status.success, data: clients);
      }
    } catch (e) {
      state = state.copyWith(status: Status.error, message: 'Failed to fetch clients: $e');
    }
  }

  Future<void> searchClients(String query) async {
    state = state.copyWith(status: Status.loading);
    try {
      final filteredClients = allClients.where((client) =>
      client.firstName.toLowerCase().contains(query.toLowerCase()) ||
          client.lastName.toLowerCase().contains(query.toLowerCase()) ||
          client.getClientData()!.gstNumber.toLowerCase().contains(query.toLowerCase()) ||
          client.username.toLowerCase().contains(query.toLowerCase())
      ).toList();

      if (filteredClients.isEmpty) {
        state = state.copyWith(status: Status.error, message: 'No clients found');
      } else {
        state = state.copyWith(status: Status.success, data: filteredClients);
      }
    } catch (e) {
      state = state.copyWith(status: Status.error, message: 'Failed to search clients: $e');
    }
  }
  Future<void> filterRegisteredTypeClients(RegistrationType type) async {
    state = state.copyWith(status: Status.loading);
    try {
      final filteredClients = type.type!.toLowerCase().trim() == 'all'
          ? allClients.toList() // Return all clients if type is 'all'
          : allClients.where((client) => client.getClientData()!.registrationTypes.contains(type.id)).toList();

      if (filteredClients.isEmpty) {
        state = state.copyWith(status: Status.error, message: 'No clients found');
      } else {
        state = state.copyWith(status: Status.success, data: filteredClients);
      }
    } catch (e) {
      state = state.copyWith(status: Status.error, message: 'Failed to search clients: $e');
    }
  }

  void _scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      limitData += 5;
      // Potentially trigger fetching more data
    }
  }
}

