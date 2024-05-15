import 'package:ca/api_services/api_services.dart';
import 'package:ca/models/role_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../database/database_service.dart';

final rolesProvider = FutureProvider<List<Role>>((ref) async {
  final List<Role> localData = await DatabaseService.database.roleDao.findAllRole();
  if (localData.isEmpty) {
    final List<Role> roles = await APIServices.fetchRoles();
    return roles;
  } else {
    return localData;
  }
});

// Method to update server with local changes
Future<void> updateServerWithLocalChanges() async {
  final List<Role> localChanges = await DatabaseService.database.roleDao.findAllUnsyncedRoleChanges();
  // Loop through local changes and update server
  for (final tagType in localChanges) {
    // Implement logic to update server with changes
    // Example: await http.put(Uri.parse('${Constants.baseUrl}vet/api/tagtypes/${tagType.id}'), body: tagType.toJson());
  }
}
