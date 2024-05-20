import 'package:ca/utility/shared_pref.dart';
import 'package:hive/hive.dart';
import '../database/database_service.dart';

class UserService {
  static Future<void> clearUserData() async {
    await SharedPref.removeAll();
    // await DatabaseService.deleteMYDatabase();
    await Hive.deleteFromDisk();
  }
}