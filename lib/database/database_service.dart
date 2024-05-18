import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'database.dart';

class DatabaseService {
  static late AppDatabase _database;

  static Future<void> initDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder('junction.db').build();
    _database = database;
  }

  static Future<void> deleteMYDatabase() async {
    final paths = join(await getDatabasesPath(), 'junction.db');
    await deleteDatabase(paths);
  }

  static AppDatabase get database => _database;
}