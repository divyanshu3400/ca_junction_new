import 'package:ca/models/firm_type_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class FirmTypeDao {

  @Query('SELECT * FROM FirmType WHERE sync=1')
  Future<List<FirmType>> findAllUnsyncedRoleChanges();

  @Query('SELECT * FROM FirmType')
  Future<List<FirmType>> findAllFirmType();

  @Query('SELECT firm FROM FirmType')
  Stream<List<String>> findAllOnlyFirmName();

  @Query('SELECT * FROM FirmType WHERE id = :id')
  Stream<FirmType?> findFirmById(int id);

  @insert
  Future<void> insertFirm(FirmType role);

  @insert
  Future<void> insertFirms(List<FirmType> role); // Modify insert method

  @Update()
  Future<void> updateFirm(FirmType role);

  @Query('DELETE FROM FirmType')
  Future<void> deleteAllFirms();

  @Query('DELETE FROM FirmType WHERE id = :id')
  Future<void> deleteFirmById(int id);

}
