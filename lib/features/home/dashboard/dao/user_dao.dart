import 'package:floor/floor.dart';
import 'dart:async';
import '../../../../models/user_model.dart';

@dao
abstract class UserDao {

  @Query('SELECT * FROM User WHERE sync=1')
  Future<List<User>> findAllUnsyncedUserChanges();

  @Query('SELECT * FROM User')
  Future<List<User>> findAllUser();

  @Query('SELECT first_name FROM User')
  Stream<List<String>> findAllUsername();

  @Query('SELECT * FROM User WHERE id = :id')
  Stream<User?> findUserById(int id);

  @insert
  Future<void> insertUser(User user);

  @insert
  Future<void> insertAllUserList(List<User> user); // Modify insert method

  @Update()
  Future<void> updateUser(User user);

  @Query('DELETE FROM User')
  Future<void> deleteAllUsers();

}
