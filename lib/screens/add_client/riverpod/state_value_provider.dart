import 'package:ca/api_services/api_services.dart';
import 'package:ca/core/network_connectivity_check/network_connectivity_provider.dart';
import 'package:ca/models/state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network_connectivity_check/network_connectivity_state.dart';
import '../../../database/database_service.dart';

final statesProvider = FutureProvider<List<StateModel>>((ref) async {
  final connectivityState = ref.watch(connectivityStatusProviders);
  if (connectivityState.connectivityStatus == ConnectivityStatus.isConnected) {
    try {
      final dynamic data = await APIServices.makeGetRequest('route/states/');
      if (data is List<dynamic>) {
        final List<StateModel> states =
            data.map((statesJson) => StateModel.fromJson(statesJson)).toList();
        await DatabaseService.database.stateDao.insertStates(states);
        return states;
      } else {
        throw Exception('Invalid data format: $data');
      }
    } catch (e) {
      return await DatabaseService.database.stateDao.findAllStates();
    }
  } else {
    final List<StateModel> localData =
        await DatabaseService.database.stateDao.findAllStates();
    if(localData.isNotEmpty){
      return localData;
    }
    else{
      throw Exception('No Data Available');
    }
  }
});
