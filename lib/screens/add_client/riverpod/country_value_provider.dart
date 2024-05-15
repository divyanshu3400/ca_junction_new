import 'package:ca/api_services/api_services.dart';
import 'package:ca/models/country_model.dart';
import 'package:ca/models/state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../database/database_service.dart';

final countriesProvider = FutureProvider<List<CountryModel>>((ref) async {
  final List<CountryModel> localData = await DatabaseService.database.countryDao.findAllCountries();
  if (localData.isEmpty) {
    final dynamic data = await APIServices.makeGetRequest('route/countries/');
    final List<CountryModel> countries = data.map((stateJson) => CountryModel.fromJson(stateJson)).toList();
    await DatabaseService.database.countryDao.insertCountries(countries);
    return countries;
  } else {
    return localData;
  }
});
