
import 'package:ca/models/client_data_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class ClientDataDao {

  @Query('SELECT * FROM ClientDataModel WHERE sync=1')
  Future<List<ClientDataModel>> findAllUnsyncedClientDataChanges();

  @Query('SELECT * FROM ClientDataModel')
  Future<List<ClientDataModel>> findAllClient();

  @Query('SELECT first_name FROM ClientDataModel')
  Stream<List<String>> findAllUsername();

  @Query('SELECT * FROM ClientDataModel WHERE id = :id')
  Stream<ClientDataModel?> findClientDataById(int id);

  @insert
  Future<void> insertUser(ClientDataModel clientDataModel);

  @insert
  Future<void> insertAllUserList(List<ClientDataModel> clientDataModel); // Modify insert method

  @Update()
  Future<void> updateClient(ClientDataModel user);

  @Query('DELETE FROM ClientDataModel')
  Future<void> deleteAllUsers();

}
