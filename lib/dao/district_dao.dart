import 'package:floor/floor.dart';

import '../models/district_model.dart';

@dao
abstract class DistrictDao {
  @Query('SELECT * FROM DistrictModel WHERE sync = 1')
  Future<List<DistrictModel>> findAllUnsyncedDistrictChanges();

  @Query('SELECT * FROM DistrictModel')
  Future<List<DistrictModel>> findAllDistricts();

  @Query('SELECT district FROM DistrictModel')
  Stream<List<String>> findAllOnlyDistricts();

  @Query('SELECT * FROM DistrictModel WHERE id = :id')
  Stream<DistrictModel?> findDistrictById(int id);

  @insert
  Future<void> insertDistrict(DistrictModel district);

  @insert
  Future<void> insertDistricts(List<DistrictModel> districts);

  @Update()
  Future<void> updateDistrict(DistrictModel district);

  @Query('DELETE FROM DistrictModel')
  Future<void> deleteAllDistricts();

  @Query('DELETE FROM DistrictModel WHERE id = :id')
  Future<void> deleteDistrictById(int id);
}
