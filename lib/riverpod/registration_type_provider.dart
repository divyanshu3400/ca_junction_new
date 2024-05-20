import 'package:ca/api_services/api_services.dart';
import 'package:ca/core/network_connectivity_check/network_connectivity_notifier.dart';
import 'package:ca/core/network_connectivity_check/network_connectivity_provider.dart';
import 'package:ca/core/network_connectivity_check/network_connectivity_state.dart';
import 'package:ca/models/registration_type_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database_service.dart';

final registrationTypeProvider =
    FutureProvider<List<RegistrationType>>((ref) async {
  final state = ref.read(connectivityStatusProviders);
  if (state.connectivityStatus == ConnectivityStatus.isConnected) {
    try {
      final List<RegistrationType> roles = await APIServices.fetchRegistrationType();
      return roles;
    } catch (e) {
      return await DatabaseService.database.registrationTypeDao.findAllRegistrationTypes();
    }
  } else {
    return await DatabaseService.database.registrationTypeDao
        .findAllRegistrationTypes();
  }
});
