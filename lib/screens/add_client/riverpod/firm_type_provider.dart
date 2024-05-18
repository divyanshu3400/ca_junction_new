import 'package:ca/api_services/api_services.dart';
import 'package:ca/core/network_connectivity_check/network_connectivity_notifier.dart';
import 'package:ca/models/firm_type_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network_connectivity_check/network_connectivity_provider.dart';
import '../../../core/network_connectivity_check/network_connectivity_state.dart';
import '../../../database/database_service.dart';

// final firmTypeProvider = FutureProvider<List<FirmType>>((ref) async {
//   final List<FirmType> localData =
//       await DatabaseService.database.firmTypeDao.findAllFirmType();
//   if (localData.isEmpty) {
//     final dynamic data = await APIServices.makeGetRequest('route/typeoffirms/');
//     if (data is List<dynamic>) {
//       final List<FirmType> firmTypes =
//           data.map((districtJson) => FirmType.fromJson(districtJson)).toList();
//       await DatabaseService.database.firmTypeDao.insertFirms(firmTypes);
//       return firmTypes;
//     } else {
//       throw Exception('Invalid data format: $data');
//     }
//   } else {
//     return localData;
//   }
// });

final firmTypeProvider = FutureProvider<List<FirmType>>((ref) async {
  final state = ref.read(connectivityStatusProviders);
  try {
    List<FirmType> firmTypes;
    if (state.connectivityStatus == ConnectivityStatus.isConnected) {
      final dynamic data =
          await APIServices.makeGetRequest('route/typeoffirms/');
      if (data is List<dynamic>) {
        firmTypes = data
            .map((districtJson) => FirmType.fromJson(districtJson))
            .toList();
        await DatabaseService.database.firmTypeDao.insertFirms(firmTypes);
      } else {
        throw Exception('Invalid data format: $data');
      }
    } else {
      firmTypes = await DatabaseService.database.firmTypeDao.findAllFirmType();
    }
    return firmTypes;
  } catch (e) {
    return await DatabaseService.database.firmTypeDao.findAllFirmType();
  }
});
