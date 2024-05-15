import 'package:ca/api_services/api_services.dart';
import 'package:ca/models/district_model.dart';
import 'package:ca/models/state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../database/database_service.dart';

final districtsProvider = FutureProvider<List<DistrictModel>>((ref) async {
  final List<DistrictModel> localData = await DatabaseService.database.districtDao.findAllDistricts();
  if (localData.isEmpty) {
    final dynamic data = await APIServices.makeGetRequest('route/districts/');
    if (data is List<dynamic>) {
      final List<DistrictModel> districts = data.map((districtJson) => DistrictModel.fromJson(districtJson)).toList();
      await DatabaseService.database.districtDao.insertDistricts(districts);
      return districts;
    } else {
      throw Exception('Invalid data format: $data');
    }
  } else {
    return localData;
  }
});
