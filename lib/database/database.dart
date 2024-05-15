// database.dart
import 'dart:async';
import 'package:ca/dao/country_dao.dart';
import 'package:ca/dao/district_dao.dart';
import 'package:ca/dao/registration_dao.dart';
import 'package:ca/features/home/dashboard/dao/user_dao.dart';
import 'package:ca/models/client_model.dart';
import 'package:ca/models/country_model.dart';
import 'package:ca/models/district_model.dart';
import 'package:ca/models/firm_type_model.dart';
import 'package:ca/models/registration_type_model.dart';
import 'package:ca/models/role_model.dart';
import 'package:ca/models/state_model.dart';
import 'package:ca/models/user_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import '../dao/client_dao.dart';
import '../dao/firm_type_dao.dart';
import '../dao/role_dao.dart';
import '../dao/state_dao.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 2, entities: [Role,User,RegistrationType,
  CountryModel,StateModel,DistrictModel,FirmType,ClientModel])
abstract class AppDatabase extends FloorDatabase {

  RoleDao get roleDao;

  UserDao get userDao;

  RegistrationTypeDao get registrationTypeDao;

  CountryDao get countryDao;

  StateDao get stateDao;

  DistrictDao get districtDao;

  FirmTypeDao get firmTypeDao;

  ClientDao get clientDao;
}