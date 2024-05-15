import 'package:floor/floor.dart';
import 'dart:convert'; // Import for JSON encoding/decoding

@entity
class ClientModel {
  @PrimaryKey()
  final int id;
  final String password;
  final String? lastLogin;
  final bool isSuperuser;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final bool isStaff;
  final bool isActive;
  final String dateJoined;
  final String? dob;
  final String? phoneNumber;
  final bool isAccepted;
  final bool sync;
  final String role;
  final int? admin;
  final String? clientData; // Change type to String for storing JSON

  ClientModel({
    required this.id,
    required this.password,
    required this.lastLogin,
    required this.isSuperuser,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.dob,
    required this.phoneNumber,
    required this.isAccepted,
    required this.sync,
    required this.role,
    required this.admin,
    this.clientData,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      password: json['password'],
      lastLogin: json['last_login'] ?? "",
      isSuperuser: json['is_superuser'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      isStaff: json['is_staff'],
      isActive: json['is_active'],
      dateJoined: json['date_joined'],
      dob: json['dob'] ?? "",
      phoneNumber: json['phone_number'],
      isAccepted: json['is_accepted'],
      sync: json['sync'],
      role: json['role'],
      admin: json['admin'],
      clientData: json['client_data'] != null ? jsonEncode(json['client_data']) : null, // Encode ClientData as JSON string
    );
  }
  // Add method to decode JSON string to ClientData object
  ClientData? getClientData() {
    if (clientData != null) {
      return ClientData.fromJson(jsonDecode(clientData!));
    }
    return null;
  }
  @override
  String toString() {
    return '$firstName $lastName';
  }
}

class ClientData {
  final int id;
  final List<int> registrationTypes;
  final String? nameOfFirm;
  final String gstNumber;
  final bool sync;
  final int firmType;
  final int cuser;

  ClientData({
    required this.id,
    required this.registrationTypes,
    required this.nameOfFirm,
    required this.gstNumber,
    required this.sync,
    required this.firmType,
    required this.cuser,
  });

  factory ClientData.fromJson(Map<String, dynamic> json) {
    return ClientData(
      id: json['id'],
      registrationTypes: List<int>.from(json['registration_types']),
      nameOfFirm: json['name_of_firm'],
      gstNumber: json['gst_number'],
      sync: json['sync'],
      firmType: json['firm_type'],
      cuser: json['cuser'],
    );
  }
  @override
  String toString() {
    return '$gstNumber $registrationTypes';
  }
}
