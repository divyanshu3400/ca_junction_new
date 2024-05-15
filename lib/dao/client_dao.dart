import 'package:ca/models/client_model.dart';
import 'package:floor/floor.dart';


@dao
abstract class ClientDao {
  @Query('SELECT * FROM ClientModel WHERE sync = 1')
  Future<List<ClientModel>> findAllUnsyncedClientChanges();

  @Query('SELECT * FROM ClientModel')
  Future<List<ClientModel>> findAllClients();

  @Query('SELECT username FROM ClientModel')
  Stream<List<String>> findAllClientName();

  @Query('SELECT * FROM ClientModel WHERE id = :id')
  Stream<ClientModel?> findClientById(int id);

  @insert
  Future<void> insertClient(ClientModel client);

  @insert
  Future<void> insertClients(List<ClientModel> clients);

  @Update()
  Future<void> updateClient(ClientModel client);

  @Query('DELETE FROM ClientModel')
  Future<void> deleteAllClients();

  @Query('DELETE FROM ClientModel WHERE id = :id')
  Future<void> deleteClientById(int id);
}
