import 'package:ca/api_services/api_services.dart';
import 'package:ca/models/registration_type_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database_service.dart';


final registrationTypeProvider = FutureProvider<List<RegistrationType>>((ref) async {
  final List<RegistrationType> localData = await DatabaseService.database.registrationTypeDao.findAllRegistrationTypes();
  if (localData.isEmpty) {
    final List<RegistrationType> roles = await APIServices.fetchRegistrationType();
    return roles;
  } else {
    return localData;
  }

});
