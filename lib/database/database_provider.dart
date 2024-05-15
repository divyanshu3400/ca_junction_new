import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'database.dart';
import 'database_service.dart';

final databaseProvider = FutureProvider<AppDatabase>((ref) async {
  dynamic instance = DatabaseService.database;
  return instance;
});
