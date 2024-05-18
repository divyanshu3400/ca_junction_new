import 'package:ca/api_services/api_services.dart';
import 'package:ca/core/network_connectivity_check/network_connectivity_provider.dart';
import 'package:ca/models/client_model.dart';
import 'package:ca/utility/constants.dart';
import 'package:ca/utility/shared_pref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network_connectivity_check/network_connectivity_state.dart';
import '../../../database/database_service.dart';
import '../../../models/client_data_model.dart';


final clientDataProvider = FutureProvider<ClientModel?>((ref) async
{
  final connectivityStatus = ref.watch(connectivityStatusProviders);
  String? userToken = SharedPref.getString(token);
  int? id = SharedPref.getInt(userId);
  if (connectivityStatus.connectivityStatus == ConnectivityStatus.isConnected) {
    try {
      final ClientModel clientsData = await APIServices.fetchClientData(userToken!);
      await DatabaseService.database.clientDao.deleteAllClients();
      await DatabaseService.database.clientDao.insertClient(clientsData);
      return clientsData;
    } catch (e) {
      return DatabaseService.database.clientDao.findClientById(id!).first;
    }
  } else {
    return DatabaseService.database.clientDao.findClientById(id!).first;
  }
});
