import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class ClientDataModel {

  @primaryKey
  int id;
  String username;
  String firstName;
  String lastName;
  String email;
  String password; // Note: Do not expose sensitive information like passwords in production
  bool isSuperuser;
  bool isStaff;
  bool isActive;
  String? dateJoined;
  String? dob;
  String? phoneNumber;
  bool isAccepted;
  bool sync;
  String? role;
  int admin;
  String adminClientJson; // Store adminClient as JSON string

  ClientDataModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.isSuperuser,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.dob,
    required this.phoneNumber,
    required this.isAccepted,
    required this.sync,
    required this.role,
    required this.admin,
    required this.adminClientJson,
  });

  // Convert AdminClientModel to JSON string
  factory ClientDataModel.fromJson(Map<String, dynamic> json) => ClientDataModel(
    id: json['id'],
    username: json['username']??'',
    firstName: json['firstName'] ?? "",
    lastName: json['lastName'] ?? "",
    email: json['email'] ?? "",
    password: json['password'] ?? "",
    isSuperuser: json['isSuperuser'] ?? false,
    isStaff: json['isStaff'] ?? false,
    isActive: json['isActive'] ?? false,
    dateJoined: json['dateJoined'] ?? "",
    dob: json['dob'] ?? "",
    phoneNumber: json['phoneNumber'] ?? "",
    isAccepted: json['isAccepted'] ?? false,
    sync: json['sync'] ?? false,
    role: json['role'] ?? "",
    admin: json['admin'] ?? 0,
    adminClientJson: json['adminClient'] != null ? jsonEncode(json['adminClient']) : '{}',
  );

  // Convert JSON string to AdminClientModel
  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
    'isSuperuser': isSuperuser,
    'isStaff': isStaff,
    'isActive': isActive,
    'dateJoined': dateJoined,
    'dob': dob,
    'phoneNumber': phoneNumber,
    'isAccepted': isAccepted,
    'sync': sync,
    'role': role,
    'admin': admin,
    'adminClientJson': adminClientJson,
  };

  @override
  String toString() {
    return '$username, $firstName $lastName';
  }
  AdminClientModel get adminClient => adminClientJson.isNotEmpty ? AdminClientModel.fromJson(jsonDecode(adminClientJson)) : AdminClientModel(id: 0, nameOfFirm: '', gstNumber: '', sync: false, firmType: 0, cuser: 0, registrationTypes: []);
}

class AdminClientModel {
  final int id;
  final String nameOfFirm;
  final String gstNumber;
  final bool sync;
  final int firmType;
  final int cuser;
  final List<int> registrationTypes;

  AdminClientModel({
    required this.id,
    required this.nameOfFirm,
    required this.gstNumber,
    required this.sync,
    required this.firmType,
    required this.cuser,
    required this.registrationTypes,
  });

  factory AdminClientModel.fromJson(Map<String, dynamic> json) => AdminClientModel(
    id: json['id'] ?? 0,
    nameOfFirm: json['nameOfFirm'] ?? "",
    gstNumber: json['gstNumber'] ?? "",
    sync: json['sync'] ?? false,
    firmType: json['firmType'] ?? 0,
    cuser: json['cuser'] ?? 0,
    registrationTypes: List<int>.from(json['registrationTypes'] ?? []),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'nameOfFirm': nameOfFirm,
    'gstNumber': gstNumber,
    'sync': sync,
    'firmType': firmType,
    'cuser': cuser,
    'registrationTypes': registrationTypes,
  };
}