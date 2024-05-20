import 'package:ca/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../api_services/api_services.dart';
import '../../../../../../components/admin/riverpod/category_details_notifier.dart';
import '../../../../../../core/network_connectivity_check/network_connectivity_provider.dart';
import '../../../../../../core/network_connectivity_check/network_connectivity_state.dart';
import '../../../../../../database/database_service.dart';
import '../../../../../../utility/base_state.dart';
import '../../../../../../utility/constants.dart';
import '../../../../../../utility/shared_pref.dart';

class UserDataNotifier extends Notifier<BaseState<User>> {
  User? user;

  @override
  BaseState<User> build() {
    fetchUserDataAPI(); // Fetch clients on initialization
    return BaseState<User>();
  }

  Future<void> fetchUserDataAPI() async {
    state = state.copyWith(status: Status.loading);
    final connectivityStatus = ref.read(connectivityStatusProviders);
    final userDao = DatabaseService.database.userDao;
    int id = SharedPref.getInt(userId) ?? 0;
    Map<String, dynamic> data = {"user_id": id};
    try {
      if (connectivityStatus.connectivityStatus ==
          ConnectivityStatus.isConnected) {
        dynamic response =
            await APIServices.makePostRequest('api/users/', data);
        final userData = User.fromJson(response['data']);
        await userDao.deleteAllUsers();
        await userDao.insertUser(userData);
        user = userData;
        state = state.copyWith(status: Status.success, data: user);
      } else {
        user = await userDao.findUserById(id).first;
        state = state.copyWith(status: Status.success, data: user);
      }

    } catch (e) {
      state = state.copyWith(
          status: Status.error, message: 'Failed to fetch clients: $e');
    }
  }
}
