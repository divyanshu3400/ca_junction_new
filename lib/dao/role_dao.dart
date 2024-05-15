import 'package:ca/models/role_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class RoleDao {

  @Query('SELECT * FROM Role WHERE sync=1')
  Future<List<Role>> findAllUnsyncedRoleChanges();

  @Query('SELECT * FROM Role')
  Future<List<Role>> findAllRole();

  @Query('SELECT tagType FROM Role')
  Stream<List<String>> findAllOnlyRole();

  @Query('SELECT * FROM Role WHERE id = :id')
  Stream<Role?> findRoleById(int id);

  @insert
  Future<void> insertRole(Role role);

  @insert
  Future<void> insertRoles(List<Role> role); // Modify insert method

  @Update()
  Future<void> updateRole(Role role);

  @Query('DELETE FROM Role')
  Future<void> deleteAllRoles();

  @Query('DELETE FROM Role WHERE id = :id')
  Future<void> deleteRoleById(int id);

}
