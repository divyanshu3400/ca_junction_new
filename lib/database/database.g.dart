// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  RoleDao? _roleDaoInstance;

  UserDao? _userDaoInstance;

  RegistrationTypeDao? _registrationTypeDaoInstance;

  CountryDao? _countryDaoInstance;

  StateDao? _stateDaoInstance;

  DistrictDao? _districtDaoInstance;

  FirmTypeDao? _firmTypeDaoInstance;

  ClientDao? _clientDaoInstance;

  ClientDataDao? _clientDataDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Role` (`role` TEXT, `roleCode` TEXT, `sync` INTEGER, PRIMARY KEY (`roleCode`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER NOT NULL, `password` TEXT, `lastLogin` TEXT, `isSuperuser` INTEGER NOT NULL, `username` TEXT NOT NULL, `firstName` TEXT NOT NULL, `lastName` TEXT NOT NULL, `email` TEXT NOT NULL, `isStaff` INTEGER NOT NULL, `isActive` INTEGER NOT NULL, `dateJoined` TEXT, `dob` TEXT, `phoneNumber` TEXT, `isAccepted` INTEGER NOT NULL, `sync` INTEGER NOT NULL, `role` TEXT NOT NULL, `admin` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RegistrationType` (`id` INTEGER, `type` TEXT, `sync` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CountryModel` (`id` INTEGER NOT NULL, `country` TEXT NOT NULL, `countryCode` TEXT NOT NULL, `sync` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `StateModel` (`id` INTEGER NOT NULL, `state` TEXT NOT NULL, `sync` INTEGER NOT NULL, `country` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `DistrictModel` (`id` INTEGER NOT NULL, `district` TEXT NOT NULL, `sync` INTEGER NOT NULL, `state` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `FirmType` (`id` INTEGER NOT NULL, `firm` TEXT NOT NULL, `description` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ClientModel` (`id` INTEGER NOT NULL, `password` TEXT NOT NULL, `lastLogin` TEXT, `isSuperuser` INTEGER NOT NULL, `username` TEXT NOT NULL, `firstName` TEXT NOT NULL, `lastName` TEXT NOT NULL, `email` TEXT NOT NULL, `isStaff` INTEGER NOT NULL, `isActive` INTEGER NOT NULL, `dateJoined` TEXT NOT NULL, `dob` TEXT, `phoneNumber` TEXT, `isAccepted` INTEGER NOT NULL, `sync` INTEGER NOT NULL, `role` TEXT NOT NULL, `admin` INTEGER, `clientData` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ClientDataModel` (`id` INTEGER NOT NULL, `username` TEXT NOT NULL, `firstName` TEXT NOT NULL, `lastName` TEXT NOT NULL, `email` TEXT NOT NULL, `password` TEXT NOT NULL, `isSuperuser` INTEGER NOT NULL, `isStaff` INTEGER NOT NULL, `isActive` INTEGER NOT NULL, `dateJoined` TEXT NOT NULL, `dob` TEXT NOT NULL, `phoneNumber` TEXT NOT NULL, `isAccepted` INTEGER NOT NULL, `sync` INTEGER NOT NULL, `role` TEXT NOT NULL, `admin` INTEGER NOT NULL, `adminClientJson` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  RoleDao get roleDao {
    return _roleDaoInstance ??= _$RoleDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  RegistrationTypeDao get registrationTypeDao {
    return _registrationTypeDaoInstance ??=
        _$RegistrationTypeDao(database, changeListener);
  }

  @override
  CountryDao get countryDao {
    return _countryDaoInstance ??= _$CountryDao(database, changeListener);
  }

  @override
  StateDao get stateDao {
    return _stateDaoInstance ??= _$StateDao(database, changeListener);
  }

  @override
  DistrictDao get districtDao {
    return _districtDaoInstance ??= _$DistrictDao(database, changeListener);
  }

  @override
  FirmTypeDao get firmTypeDao {
    return _firmTypeDaoInstance ??= _$FirmTypeDao(database, changeListener);
  }

  @override
  ClientDao get clientDao {
    return _clientDaoInstance ??= _$ClientDao(database, changeListener);
  }

  @override
  ClientDataDao get clientDataDao {
    return _clientDataDaoInstance ??= _$ClientDataDao(database, changeListener);
  }
}

class _$RoleDao extends RoleDao {
  _$RoleDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _roleInsertionAdapter = InsertionAdapter(
            database,
            'Role',
            (Role item) => <String, Object?>{
                  'role': item.role,
                  'roleCode': item.roleCode,
                  'sync': item.sync == null ? null : (item.sync! ? 1 : 0)
                },
            changeListener),
        _roleUpdateAdapter = UpdateAdapter(
            database,
            'Role',
            ['roleCode'],
            (Role item) => <String, Object?>{
                  'role': item.role,
                  'roleCode': item.roleCode,
                  'sync': item.sync == null ? null : (item.sync! ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Role> _roleInsertionAdapter;

  final UpdateAdapter<Role> _roleUpdateAdapter;

  @override
  Future<List<Role>> findAllUnsyncedRoleChanges() async {
    return _queryAdapter.queryList('SELECT * FROM Role WHERE sync=1',
        mapper: (Map<String, Object?> row) => Role(
            role: row['role'] as String?,
            roleCode: row['roleCode'] as String?,
            sync: row['sync'] == null ? null : (row['sync'] as int) != 0));
  }

  @override
  Future<List<Role>> findAllRole() async {
    return _queryAdapter.queryList('SELECT * FROM Role',
        mapper: (Map<String, Object?> row) => Role(
            role: row['role'] as String?,
            roleCode: row['roleCode'] as String?,
            sync: row['sync'] == null ? null : (row['sync'] as int) != 0));
  }

  @override
  Stream<List<String>> findAllOnlyRole() {
    return _queryAdapter.queryListStream('SELECT tagType FROM Role',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        queryableName: 'Role',
        isView: false);
  }

  @override
  Stream<Role?> findRoleById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Role WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Role(
            role: row['role'] as String?,
            roleCode: row['roleCode'] as String?,
            sync: row['sync'] == null ? null : (row['sync'] as int) != 0),
        arguments: [id],
        queryableName: 'Role',
        isView: false);
  }

  @override
  Future<void> deleteAllRoles() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Role');
  }

  @override
  Future<void> deleteRoleById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Role WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertRole(Role role) async {
    await _roleInsertionAdapter.insert(role, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertRoles(List<Role> role) async {
    await _roleInsertionAdapter.insertList(role, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRole(Role role) async {
    await _roleUpdateAdapter.update(role, OnConflictStrategy.abort);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'password': item.password,
                  'lastLogin': item.lastLogin,
                  'isSuperuser': item.isSuperuser ? 1 : 0,
                  'username': item.username,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'email': item.email,
                  'isStaff': item.isStaff ? 1 : 0,
                  'isActive': item.isActive ? 1 : 0,
                  'dateJoined': item.dateJoined,
                  'dob': item.dob,
                  'phoneNumber': item.phoneNumber,
                  'isAccepted': item.isAccepted ? 1 : 0,
                  'sync': item.sync ? 1 : 0,
                  'role': item.role,
                  'admin': item.admin
                },
            changeListener),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'password': item.password,
                  'lastLogin': item.lastLogin,
                  'isSuperuser': item.isSuperuser ? 1 : 0,
                  'username': item.username,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'email': item.email,
                  'isStaff': item.isStaff ? 1 : 0,
                  'isActive': item.isActive ? 1 : 0,
                  'dateJoined': item.dateJoined,
                  'dob': item.dob,
                  'phoneNumber': item.phoneNumber,
                  'isAccepted': item.isAccepted ? 1 : 0,
                  'sync': item.sync ? 1 : 0,
                  'role': item.role,
                  'admin': item.admin
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  @override
  Future<List<User>> findAllUnsyncedUserChanges() async {
    return _queryAdapter.queryList('SELECT * FROM User WHERE sync=1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int,
            password: row['password'] as String?,
            lastLogin: row['lastLogin'] as String?,
            isSuperuser: (row['isSuperuser'] as int) != 0,
            username: row['username'] as String,
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            email: row['email'] as String,
            isStaff: (row['isStaff'] as int) != 0,
            isActive: (row['isActive'] as int) != 0,
            dateJoined: row['dateJoined'] as String?,
            dob: row['dob'] as String?,
            phoneNumber: row['phoneNumber'] as String?,
            isAccepted: (row['isAccepted'] as int) != 0,
            sync: (row['sync'] as int) != 0,
            role: row['role'] as String,
            admin: row['admin'] as int?));
  }

  @override
  Future<List<User>> findAllUser() async {
    return _queryAdapter.queryList('SELECT * FROM User',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int,
            password: row['password'] as String?,
            lastLogin: row['lastLogin'] as String?,
            isSuperuser: (row['isSuperuser'] as int) != 0,
            username: row['username'] as String,
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            email: row['email'] as String,
            isStaff: (row['isStaff'] as int) != 0,
            isActive: (row['isActive'] as int) != 0,
            dateJoined: row['dateJoined'] as String?,
            dob: row['dob'] as String?,
            phoneNumber: row['phoneNumber'] as String?,
            isAccepted: (row['isAccepted'] as int) != 0,
            sync: (row['sync'] as int) != 0,
            role: row['role'] as String,
            admin: row['admin'] as int?));
  }

  @override
  Stream<List<String>> findAllUsername() {
    return _queryAdapter.queryListStream('SELECT first_name FROM User',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        queryableName: 'User',
        isView: false);
  }

  @override
  Stream<User?> findUserById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM User WHERE id = ?1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int,
            password: row['password'] as String?,
            lastLogin: row['lastLogin'] as String?,
            isSuperuser: (row['isSuperuser'] as int) != 0,
            username: row['username'] as String,
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            email: row['email'] as String,
            isStaff: (row['isStaff'] as int) != 0,
            isActive: (row['isActive'] as int) != 0,
            dateJoined: row['dateJoined'] as String?,
            dob: row['dob'] as String?,
            phoneNumber: row['phoneNumber'] as String?,
            isAccepted: (row['isAccepted'] as int) != 0,
            sync: (row['sync'] as int) != 0,
            role: row['role'] as String,
            admin: row['admin'] as int?),
        arguments: [id],
        queryableName: 'User',
        isView: false);
  }

  @override
  Future<void> deleteAllUsers() async {
    await _queryAdapter.queryNoReturn('DELETE FROM User');
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertAllUserList(List<User> user) async {
    await _userInsertionAdapter.insertList(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUser(User user) async {
    await _userUpdateAdapter.update(user, OnConflictStrategy.abort);
  }
}

class _$RegistrationTypeDao extends RegistrationTypeDao {
  _$RegistrationTypeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _registrationTypeInsertionAdapter = InsertionAdapter(
            database,
            'RegistrationType',
            (RegistrationType item) => <String, Object?>{
                  'id': item.id,
                  'type': item.type,
                  'sync': item.sync == null ? null : (item.sync! ? 1 : 0)
                }),
        _registrationTypeUpdateAdapter = UpdateAdapter(
            database,
            'RegistrationType',
            ['id'],
            (RegistrationType item) => <String, Object?>{
                  'id': item.id,
                  'type': item.type,
                  'sync': item.sync == null ? null : (item.sync! ? 1 : 0)
                }),
        _registrationTypeDeletionAdapter = DeletionAdapter(
            database,
            'RegistrationType',
            ['id'],
            (RegistrationType item) => <String, Object?>{
                  'id': item.id,
                  'type': item.type,
                  'sync': item.sync == null ? null : (item.sync! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RegistrationType> _registrationTypeInsertionAdapter;

  final UpdateAdapter<RegistrationType> _registrationTypeUpdateAdapter;

  final DeletionAdapter<RegistrationType> _registrationTypeDeletionAdapter;

  @override
  Future<List<RegistrationType>> findAllRegistrationTypes() async {
    return _queryAdapter.queryList('SELECT * FROM RegistrationType',
        mapper: (Map<String, Object?> row) => RegistrationType(
            row['id'] as int?,
            row['type'] as String?,
            row['sync'] == null ? null : (row['sync'] as int) != 0));
  }

  @override
  Future<RegistrationType?> findRegistrationTypeById(int id) async {
    return _queryAdapter.query('SELECT * FROM RegistrationType WHERE id = ?1',
        mapper: (Map<String, Object?> row) => RegistrationType(
            row['id'] as int?,
            row['type'] as String?,
            row['sync'] == null ? null : (row['sync'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<void> deleteAllRegistrationTypes() async {
    await _queryAdapter.queryNoReturn('DELETE FROM RegistrationType');
  }

  @override
  Future<void> insertRegistrationType(RegistrationType registrationType) async {
    await _registrationTypeInsertionAdapter.insert(
        registrationType, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertAllRegistrationTypes(
      List<RegistrationType> registrationTypes) async {
    await _registrationTypeInsertionAdapter.insertList(
        registrationTypes, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRegistrationType(RegistrationType registrationType) async {
    await _registrationTypeUpdateAdapter.update(
        registrationType, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteRegistrationType(RegistrationType registrationType) async {
    await _registrationTypeDeletionAdapter.delete(registrationType);
  }
}

class _$CountryDao extends CountryDao {
  _$CountryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _countryModelInsertionAdapter = InsertionAdapter(
            database,
            'CountryModel',
            (CountryModel item) => <String, Object?>{
                  'id': item.id,
                  'country': item.country,
                  'countryCode': item.countryCode,
                  'sync': item.sync ? 1 : 0
                },
            changeListener),
        _countryModelUpdateAdapter = UpdateAdapter(
            database,
            'CountryModel',
            ['id'],
            (CountryModel item) => <String, Object?>{
                  'id': item.id,
                  'country': item.country,
                  'countryCode': item.countryCode,
                  'sync': item.sync ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CountryModel> _countryModelInsertionAdapter;

  final UpdateAdapter<CountryModel> _countryModelUpdateAdapter;

  @override
  Future<List<CountryModel>> findAllUnsyncedCountryChanges() async {
    return _queryAdapter.queryList('SELECT * FROM CountryModel WHERE sync = 1',
        mapper: (Map<String, Object?> row) => CountryModel(
            id: row['id'] as int,
            country: row['country'] as String,
            countryCode: row['countryCode'] as String,
            sync: (row['sync'] as int) != 0));
  }

  @override
  Future<List<CountryModel>> findAllCountries() async {
    return _queryAdapter.queryList('SELECT * FROM CountryModel',
        mapper: (Map<String, Object?> row) => CountryModel(
            id: row['id'] as int,
            country: row['country'] as String,
            countryCode: row['countryCode'] as String,
            sync: (row['sync'] as int) != 0));
  }

  @override
  Stream<List<String>> findAllOnlyCountries() {
    return _queryAdapter.queryListStream('SELECT country FROM CountryModel',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        queryableName: 'CountryModel',
        isView: false);
  }

  @override
  Stream<CountryModel?> findCountryById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM CountryModel WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CountryModel(
            id: row['id'] as int,
            country: row['country'] as String,
            countryCode: row['countryCode'] as String,
            sync: (row['sync'] as int) != 0),
        arguments: [id],
        queryableName: 'CountryModel',
        isView: false);
  }

  @override
  Future<void> deleteAllCountries() async {
    await _queryAdapter.queryNoReturn('DELETE FROM CountryModel');
  }

  @override
  Future<void> deleteCountryById(int id) async {
    await _queryAdapter.queryNoReturn('DELETE FROM CountryModel WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertCountry(CountryModel country) async {
    await _countryModelInsertionAdapter.insert(
        country, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertCountries(List<CountryModel> countries) async {
    await _countryModelInsertionAdapter.insertList(
        countries, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCountry(CountryModel country) async {
    await _countryModelUpdateAdapter.update(country, OnConflictStrategy.abort);
  }
}

class _$StateDao extends StateDao {
  _$StateDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _stateModelInsertionAdapter = InsertionAdapter(
            database,
            'StateModel',
            (StateModel item) => <String, Object?>{
                  'id': item.id,
                  'state': item.state,
                  'sync': item.sync ? 1 : 0,
                  'country': item.country
                },
            changeListener),
        _stateModelUpdateAdapter = UpdateAdapter(
            database,
            'StateModel',
            ['id'],
            (StateModel item) => <String, Object?>{
                  'id': item.id,
                  'state': item.state,
                  'sync': item.sync ? 1 : 0,
                  'country': item.country
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<StateModel> _stateModelInsertionAdapter;

  final UpdateAdapter<StateModel> _stateModelUpdateAdapter;

  @override
  Future<List<StateModel>> findAllUnsyncedStateChanges() async {
    return _queryAdapter.queryList('SELECT * FROM StateModel WHERE sync = 1',
        mapper: (Map<String, Object?> row) => StateModel(
            id: row['id'] as int,
            state: row['state'] as String,
            sync: (row['sync'] as int) != 0,
            country: row['country'] as int));
  }

  @override
  Future<List<StateModel>> findAllStates() async {
    return _queryAdapter.queryList('SELECT * FROM StateModel',
        mapper: (Map<String, Object?> row) => StateModel(
            id: row['id'] as int,
            state: row['state'] as String,
            sync: (row['sync'] as int) != 0,
            country: row['country'] as int));
  }

  @override
  Stream<List<String>> findAllOnlyStates() {
    return _queryAdapter.queryListStream('SELECT state FROM StateModel',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        queryableName: 'StateModel',
        isView: false);
  }

  @override
  Stream<StateModel?> findStateById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM StateModel WHERE id = ?1',
        mapper: (Map<String, Object?> row) => StateModel(
            id: row['id'] as int,
            state: row['state'] as String,
            sync: (row['sync'] as int) != 0,
            country: row['country'] as int),
        arguments: [id],
        queryableName: 'StateModel',
        isView: false);
  }

  @override
  Future<void> deleteAllStates() async {
    await _queryAdapter.queryNoReturn('DELETE FROM StateModel');
  }

  @override
  Future<void> deleteStateById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM StateModel WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertState(StateModel state) async {
    await _stateModelInsertionAdapter.insert(state, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertStates(List<StateModel> states) async {
    await _stateModelInsertionAdapter.insertList(
        states, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateState(StateModel state) async {
    await _stateModelUpdateAdapter.update(state, OnConflictStrategy.abort);
  }
}

class _$DistrictDao extends DistrictDao {
  _$DistrictDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _districtModelInsertionAdapter = InsertionAdapter(
            database,
            'DistrictModel',
            (DistrictModel item) => <String, Object?>{
                  'id': item.id,
                  'district': item.district,
                  'sync': item.sync ? 1 : 0,
                  'state': item.state
                },
            changeListener),
        _districtModelUpdateAdapter = UpdateAdapter(
            database,
            'DistrictModel',
            ['id'],
            (DistrictModel item) => <String, Object?>{
                  'id': item.id,
                  'district': item.district,
                  'sync': item.sync ? 1 : 0,
                  'state': item.state
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<DistrictModel> _districtModelInsertionAdapter;

  final UpdateAdapter<DistrictModel> _districtModelUpdateAdapter;

  @override
  Future<List<DistrictModel>> findAllUnsyncedDistrictChanges() async {
    return _queryAdapter.queryList('SELECT * FROM DistrictModel WHERE sync = 1',
        mapper: (Map<String, Object?> row) => DistrictModel(
            id: row['id'] as int,
            district: row['district'] as String,
            sync: (row['sync'] as int) != 0,
            state: row['state'] as int));
  }

  @override
  Future<List<DistrictModel>> findAllDistricts() async {
    return _queryAdapter.queryList('SELECT * FROM DistrictModel',
        mapper: (Map<String, Object?> row) => DistrictModel(
            id: row['id'] as int,
            district: row['district'] as String,
            sync: (row['sync'] as int) != 0,
            state: row['state'] as int));
  }

  @override
  Stream<List<String>> findAllOnlyDistricts() {
    return _queryAdapter.queryListStream('SELECT district FROM DistrictModel',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        queryableName: 'DistrictModel',
        isView: false);
  }

  @override
  Stream<DistrictModel?> findDistrictById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM DistrictModel WHERE id = ?1',
        mapper: (Map<String, Object?> row) => DistrictModel(
            id: row['id'] as int,
            district: row['district'] as String,
            sync: (row['sync'] as int) != 0,
            state: row['state'] as int),
        arguments: [id],
        queryableName: 'DistrictModel',
        isView: false);
  }

  @override
  Future<void> deleteAllDistricts() async {
    await _queryAdapter.queryNoReturn('DELETE FROM DistrictModel');
  }

  @override
  Future<void> deleteDistrictById(int id) async {
    await _queryAdapter.queryNoReturn('DELETE FROM DistrictModel WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertDistrict(DistrictModel district) async {
    await _districtModelInsertionAdapter.insert(
        district, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertDistricts(List<DistrictModel> districts) async {
    await _districtModelInsertionAdapter.insertList(
        districts, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateDistrict(DistrictModel district) async {
    await _districtModelUpdateAdapter.update(
        district, OnConflictStrategy.abort);
  }
}

class _$FirmTypeDao extends FirmTypeDao {
  _$FirmTypeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _firmTypeInsertionAdapter = InsertionAdapter(
            database,
            'FirmType',
            (FirmType item) => <String, Object?>{
                  'id': item.id,
                  'firm': item.firm,
                  'description': item.description
                },
            changeListener),
        _firmTypeUpdateAdapter = UpdateAdapter(
            database,
            'FirmType',
            ['id'],
            (FirmType item) => <String, Object?>{
                  'id': item.id,
                  'firm': item.firm,
                  'description': item.description
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FirmType> _firmTypeInsertionAdapter;

  final UpdateAdapter<FirmType> _firmTypeUpdateAdapter;

  @override
  Future<List<FirmType>> findAllUnsyncedRoleChanges() async {
    return _queryAdapter.queryList('SELECT * FROM FirmType WHERE sync=1',
        mapper: (Map<String, Object?> row) => FirmType(
            id: row['id'] as int,
            firm: row['firm'] as String,
            description: row['description'] as String));
  }

  @override
  Future<List<FirmType>> findAllFirmType() async {
    return _queryAdapter.queryList('SELECT * FROM FirmType',
        mapper: (Map<String, Object?> row) => FirmType(
            id: row['id'] as int,
            firm: row['firm'] as String,
            description: row['description'] as String));
  }

  @override
  Stream<List<String>> findAllOnlyFirmName() {
    return _queryAdapter.queryListStream('SELECT firm FROM FirmType',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        queryableName: 'FirmType',
        isView: false);
  }

  @override
  Stream<FirmType?> findFirmById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM FirmType WHERE id = ?1',
        mapper: (Map<String, Object?> row) => FirmType(
            id: row['id'] as int,
            firm: row['firm'] as String,
            description: row['description'] as String),
        arguments: [id],
        queryableName: 'FirmType',
        isView: false);
  }

  @override
  Future<void> deleteAllFirms() async {
    await _queryAdapter.queryNoReturn('DELETE FROM FirmType');
  }

  @override
  Future<void> deleteFirmById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM FirmType WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertFirm(FirmType role) async {
    await _firmTypeInsertionAdapter.insert(role, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertFirms(List<FirmType> role) async {
    await _firmTypeInsertionAdapter.insertList(role, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateFirm(FirmType role) async {
    await _firmTypeUpdateAdapter.update(role, OnConflictStrategy.abort);
  }
}

class _$ClientDao extends ClientDao {
  _$ClientDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _clientModelInsertionAdapter = InsertionAdapter(
            database,
            'ClientModel',
            (ClientModel item) => <String, Object?>{
                  'id': item.id,
                  'password': item.password,
                  'lastLogin': item.lastLogin,
                  'isSuperuser': item.isSuperuser ? 1 : 0,
                  'username': item.username,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'email': item.email,
                  'isStaff': item.isStaff ? 1 : 0,
                  'isActive': item.isActive ? 1 : 0,
                  'dateJoined': item.dateJoined,
                  'dob': item.dob,
                  'phoneNumber': item.phoneNumber,
                  'isAccepted': item.isAccepted ? 1 : 0,
                  'sync': item.sync ? 1 : 0,
                  'role': item.role,
                  'admin': item.admin,
                  'clientData': item.clientData
                },
            changeListener),
        _clientModelUpdateAdapter = UpdateAdapter(
            database,
            'ClientModel',
            ['id'],
            (ClientModel item) => <String, Object?>{
                  'id': item.id,
                  'password': item.password,
                  'lastLogin': item.lastLogin,
                  'isSuperuser': item.isSuperuser ? 1 : 0,
                  'username': item.username,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'email': item.email,
                  'isStaff': item.isStaff ? 1 : 0,
                  'isActive': item.isActive ? 1 : 0,
                  'dateJoined': item.dateJoined,
                  'dob': item.dob,
                  'phoneNumber': item.phoneNumber,
                  'isAccepted': item.isAccepted ? 1 : 0,
                  'sync': item.sync ? 1 : 0,
                  'role': item.role,
                  'admin': item.admin,
                  'clientData': item.clientData
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ClientModel> _clientModelInsertionAdapter;

  final UpdateAdapter<ClientModel> _clientModelUpdateAdapter;

  @override
  Future<List<ClientModel>> findAllUnsyncedClientChanges() async {
    return _queryAdapter.queryList('SELECT * FROM ClientModel WHERE sync = 1',
        mapper: (Map<String, Object?> row) => ClientModel(
            id: row['id'] as int,
            password: row['password'] as String,
            lastLogin: row['lastLogin'] as String?,
            isSuperuser: (row['isSuperuser'] as int) != 0,
            username: row['username'] as String,
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            email: row['email'] as String,
            isStaff: (row['isStaff'] as int) != 0,
            isActive: (row['isActive'] as int) != 0,
            dateJoined: row['dateJoined'] as String,
            dob: row['dob'] as String?,
            phoneNumber: row['phoneNumber'] as String?,
            isAccepted: (row['isAccepted'] as int) != 0,
            sync: (row['sync'] as int) != 0,
            role: row['role'] as String,
            admin: row['admin'] as int?,
            clientData: row['clientData'] as String?));
  }

  @override
  Future<List<ClientModel>> findAllClients() async {
    return _queryAdapter.queryList('SELECT * FROM ClientModel',
        mapper: (Map<String, Object?> row) => ClientModel(
            id: row['id'] as int,
            password: row['password'] as String,
            lastLogin: row['lastLogin'] as String?,
            isSuperuser: (row['isSuperuser'] as int) != 0,
            username: row['username'] as String,
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            email: row['email'] as String,
            isStaff: (row['isStaff'] as int) != 0,
            isActive: (row['isActive'] as int) != 0,
            dateJoined: row['dateJoined'] as String,
            dob: row['dob'] as String?,
            phoneNumber: row['phoneNumber'] as String?,
            isAccepted: (row['isAccepted'] as int) != 0,
            sync: (row['sync'] as int) != 0,
            role: row['role'] as String,
            admin: row['admin'] as int?,
            clientData: row['clientData'] as String?));
  }

  @override
  Stream<List<String>> findAllClientName() {
    return _queryAdapter.queryListStream('SELECT username FROM ClientModel',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        queryableName: 'ClientModel',
        isView: false);
  }

  @override
  Stream<ClientModel?> findClientById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM ClientModel WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ClientModel(
            id: row['id'] as int,
            password: row['password'] as String,
            lastLogin: row['lastLogin'] as String?,
            isSuperuser: (row['isSuperuser'] as int) != 0,
            username: row['username'] as String,
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            email: row['email'] as String,
            isStaff: (row['isStaff'] as int) != 0,
            isActive: (row['isActive'] as int) != 0,
            dateJoined: row['dateJoined'] as String,
            dob: row['dob'] as String?,
            phoneNumber: row['phoneNumber'] as String?,
            isAccepted: (row['isAccepted'] as int) != 0,
            sync: (row['sync'] as int) != 0,
            role: row['role'] as String,
            admin: row['admin'] as int?,
            clientData: row['clientData'] as String?),
        arguments: [id],
        queryableName: 'ClientModel',
        isView: false);
  }

  @override
  Future<void> deleteAllClients() async {
    await _queryAdapter.queryNoReturn('DELETE FROM ClientModel');
  }

  @override
  Future<void> deleteClientById(int id) async {
    await _queryAdapter.queryNoReturn('DELETE FROM ClientModel WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertClient(ClientModel client) async {
    await _clientModelInsertionAdapter.insert(client, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertClients(List<ClientModel> clients) async {
    await _clientModelInsertionAdapter.insertList(
        clients, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateClient(ClientModel client) async {
    await _clientModelUpdateAdapter.update(client, OnConflictStrategy.abort);
  }
}

class _$ClientDataDao extends ClientDataDao {
  _$ClientDataDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _clientDataModelInsertionAdapter = InsertionAdapter(
            database,
            'ClientDataModel',
            (ClientDataModel item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'email': item.email,
                  'password': item.password,
                  'isSuperuser': item.isSuperuser ? 1 : 0,
                  'isStaff': item.isStaff ? 1 : 0,
                  'isActive': item.isActive ? 1 : 0,
                  'dateJoined': item.dateJoined,
                  'dob': item.dob,
                  'phoneNumber': item.phoneNumber,
                  'isAccepted': item.isAccepted ? 1 : 0,
                  'sync': item.sync ? 1 : 0,
                  'role': item.role,
                  'admin': item.admin,
                  'adminClientJson': item.adminClientJson
                },
            changeListener),
        _clientDataModelUpdateAdapter = UpdateAdapter(
            database,
            'ClientDataModel',
            ['id'],
            (ClientDataModel item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'email': item.email,
                  'password': item.password,
                  'isSuperuser': item.isSuperuser ? 1 : 0,
                  'isStaff': item.isStaff ? 1 : 0,
                  'isActive': item.isActive ? 1 : 0,
                  'dateJoined': item.dateJoined,
                  'dob': item.dob,
                  'phoneNumber': item.phoneNumber,
                  'isAccepted': item.isAccepted ? 1 : 0,
                  'sync': item.sync ? 1 : 0,
                  'role': item.role,
                  'admin': item.admin,
                  'adminClientJson': item.adminClientJson
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ClientDataModel> _clientDataModelInsertionAdapter;

  final UpdateAdapter<ClientDataModel> _clientDataModelUpdateAdapter;

  @override
  Future<List<ClientDataModel>> findAllUnsyncedClientDataChanges() async {
    return _queryAdapter.queryList('SELECT * FROM ClientDataModel WHERE sync=1',
        mapper: (Map<String, Object?> row) => ClientDataModel(
            id: row['id'] as int,
            username: row['username'] as String,
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            email: row['email'] as String,
            password: row['password'] as String,
            isSuperuser: (row['isSuperuser'] as int) != 0,
            isStaff: (row['isStaff'] as int) != 0,
            isActive: (row['isActive'] as int) != 0,
            dateJoined: row['dateJoined'] as String,
            dob: row['dob'] as String,
            phoneNumber: row['phoneNumber'] as String,
            isAccepted: (row['isAccepted'] as int) != 0,
            sync: (row['sync'] as int) != 0,
            role: row['role'] as String,
            admin: row['admin'] as int,
            adminClientJson: row['adminClientJson'] as String));
  }

  @override
  Future<List<ClientDataModel>> findAllClient() async {
    return _queryAdapter.queryList('SELECT * FROM ClientDataModel',
        mapper: (Map<String, Object?> row) => ClientDataModel(
            id: row['id'] as int,
            username: row['username'] as String,
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            email: row['email'] as String,
            password: row['password'] as String,
            isSuperuser: (row['isSuperuser'] as int) != 0,
            isStaff: (row['isStaff'] as int) != 0,
            isActive: (row['isActive'] as int) != 0,
            dateJoined: row['dateJoined'] as String,
            dob: row['dob'] as String,
            phoneNumber: row['phoneNumber'] as String,
            isAccepted: (row['isAccepted'] as int) != 0,
            sync: (row['sync'] as int) != 0,
            role: row['role'] as String,
            admin: row['admin'] as int,
            adminClientJson: row['adminClientJson'] as String));
  }

  @override
  Stream<List<String>> findAllUsername() {
    return _queryAdapter.queryListStream(
        'SELECT first_name FROM ClientDataModel',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        queryableName: 'ClientDataModel',
        isView: false);
  }

  @override
  Stream<ClientDataModel?> findClientDataById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM ClientDataModel WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ClientDataModel(
            id: row['id'] as int,
            username: row['username'] as String,
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            email: row['email'] as String,
            password: row['password'] as String,
            isSuperuser: (row['isSuperuser'] as int) != 0,
            isStaff: (row['isStaff'] as int) != 0,
            isActive: (row['isActive'] as int) != 0,
            dateJoined: row['dateJoined'] as String,
            dob: row['dob'] as String,
            phoneNumber: row['phoneNumber'] as String,
            isAccepted: (row['isAccepted'] as int) != 0,
            sync: (row['sync'] as int) != 0,
            role: row['role'] as String,
            admin: row['admin'] as int,
            adminClientJson: row['adminClientJson'] as String),
        arguments: [id],
        queryableName: 'ClientDataModel',
        isView: false);
  }

  @override
  Future<void> deleteAllUsers() async {
    await _queryAdapter.queryNoReturn('DELETE FROM ClientDataModel');
  }

  @override
  Future<void> insertUser(ClientDataModel clientDataModel) async {
    await _clientDataModelInsertionAdapter.insert(
        clientDataModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertAllUserList(List<ClientDataModel> clientDataModel) async {
    await _clientDataModelInsertionAdapter.insertList(
        clientDataModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateClient(ClientDataModel user) async {
    await _clientDataModelUpdateAdapter.update(user, OnConflictStrategy.abort);
  }
}
