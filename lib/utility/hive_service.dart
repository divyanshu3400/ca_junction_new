import 'package:ca/utility/constants.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveService {
  static final HiveService _singleton = HiveService._internal();

  factory HiveService() {
    return _singleton;
  }

  HiveService._internal();

  late Box _box;

  Future<void> init() async {
    final appDocumentDirectory =
    await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    _box = await Hive.openBox(userBox);
  }

  Future<void> closeBox() async {
    await _box.close();
  }

  Future<void> putData(String key, dynamic data) async {
    await _box.put(key, data);
  }

  dynamic getData(String key) {
    return _box.get(key);
  }
}
