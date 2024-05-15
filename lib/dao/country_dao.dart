import 'package:floor/floor.dart';
import '../models/country_model.dart';


@dao
abstract class CountryDao {
  @Query('SELECT * FROM CountryModel WHERE sync = 1')
  Future<List<CountryModel>> findAllUnsyncedCountryChanges();

  @Query('SELECT * FROM CountryModel')
  Future<List<CountryModel>> findAllCountries();

  @Query('SELECT country FROM CountryModel')
  Stream<List<String>> findAllOnlyCountries();

  @Query('SELECT * FROM CountryModel WHERE id = :id')
  Stream<CountryModel?> findCountryById(int id);

  @insert
  Future<void> insertCountry(CountryModel country);

  @insert
  Future<void> insertCountries(List<CountryModel> countries);

  @Update()
  Future<void> updateCountry(CountryModel country);

  @Query('DELETE FROM CountryModel')
  Future<void> deleteAllCountries();

  @Query('DELETE FROM CountryModel WHERE id = :id')
  Future<void> deleteCountryById(int id);
}
