import 'package:floor/floor.dart';
import '../models/registration_type_model.dart';

@dao
abstract class RegistrationTypeDao {

  @Query('SELECT * FROM RegistrationType')
  Future<List<RegistrationType>> findAllRegistrationTypes();

  @Query('SELECT * FROM RegistrationType WHERE id = :id')
  Future<RegistrationType?> findRegistrationTypeById(int id);

  @insert
  Future<void> insertRegistrationType(RegistrationType registrationType);

  @insert
  Future<void> insertAllRegistrationTypes(List<RegistrationType> registrationTypes);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateRegistrationType(RegistrationType registrationType);

  @delete
  Future<void> deleteRegistrationType(RegistrationType registrationType);

  @Query('DELETE FROM RegistrationType')
  Future<void> deleteAllRegistrationTypes();
}
