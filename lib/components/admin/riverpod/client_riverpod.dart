import 'package:ca/api_services/api_services.dart';
import 'package:ca/core/network_connectivity_check/network_connectivity_provider.dart';
import 'package:ca/models/client_model.dart';
import 'package:ca/utility/constants.dart';
import 'package:ca/utility/shared_pref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network_connectivity_check/network_connectivity_notifier.dart';
import '../../../database/database_service.dart';


final clientsProvider = FutureProvider<List<ClientModel>>((ref) async {
  final connectivityStatus = ref.watch(connectivityStatusProviders);
  String? userToken = SharedPref.getString(token);
  if(connectivityStatus == ConnectivityStatus.isConnected){
    try{
      final List<dynamic> clientsData = await APIServices.fetchClients(userToken!);
      List<ClientModel> clients = clientsData.map((client) => ClientModel.fromJson(client)).toList();
      await DatabaseService.database.clientDao.insertClients(clients);
      return clients;
    }
    catch(e){
      return await DatabaseService.database.clientDao.findAllClients();
    }
  }
  else{
    return await DatabaseService.database.clientDao.findAllClients();
  }
});
