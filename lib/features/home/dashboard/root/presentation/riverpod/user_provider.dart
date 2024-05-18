import 'package:ca/api_services/api_services.dart';
import 'package:ca/core/network_connectivity_check/network_connectivity_provider.dart';
import 'package:ca/models/role_model.dart';
import 'package:ca/models/user_model.dart';
import 'package:ca/utility/constants.dart';
import 'package:ca/utility/shared_pref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/network_connectivity_check/network_connectivity_state.dart';
import '../../../../../../database/database_service.dart';

final userDataProvider = FutureProvider<User>((ref) async {
  final userDao = DatabaseService.database.userDao;
  int id = SharedPref.getInt(userId) ?? 0;
  Map<String, dynamic> data = {"user_id": id};
  final state = ref.read(connectivityStatusProviders);
  if (state.connectivityStatus == ConnectivityStatus.isConnected) {
    try {
      dynamic response = await APIServices.makePostRequest('api/users/', data);
      final user = User.fromJson(response['data']);
      await userDao.deleteAllUsers();
      await userDao.insertUser(user);
      return user;
    } catch (error) {
      final localData = await userDao.findUserById(id).first; // Wait for the first result
      if (localData != null) {
        return localData;
      } else {
        throw Exception('No user found in local database');
      }
    }
  } else {
    try {
      final localData = await userDao.findUserById(id).first; // Wait for the first result
      if (localData != null) {
        return localData;
      } else {
        throw Exception('No user found in local database');
      }
    } catch (error) {
      // Handle potential errors from the local database query
      throw Exception('Failed to fetch user from local database');
    }
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
