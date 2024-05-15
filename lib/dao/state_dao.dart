import 'package:floor/floor.dart';

import '../models/state_model.dart';


@dao
abstract class StateDao {

  @Query('SELECT * FROM StateModel WHERE sync = 1')
  Future<List<StateModel>> findAllUnsyncedStateChanges();

  @Query('SELECT * FROM StateModel')
  Future<List<StateModel>> findAllStates();

  @Query('SELECT state FROM StateModel')
  Stream<List<String>> findAllOnlyStates();

  @Query('SELECT * FROM StateModel WHERE id = :id')
  Stream<StateModel?> findStateById(int id);

  @insert
  Future<void> insertState(StateModel state);

  @insert
  Future<void> insertStates(List<StateModel> states);

  @Update()
  Future<void> updateState(StateModel state);

  @Query('DELETE FROM StateModel')
  Future<void> deleteAllStates();

  @Query('DELETE FROM StateModel WHERE id = :id')
  Future<void> deleteStateById(int id);
}
