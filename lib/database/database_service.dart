import 'database.dart'; // Import your generated database class

class DatabaseService {
  static late AppDatabase _database;

  static Future<void> initDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder('junction.db').build();
    _database = database;
  }

  static AppDatabase get database => _database;
}
