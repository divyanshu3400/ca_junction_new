
import 'package:floor/floor.dart';

@entity
class User {

  @primaryKey
  int id;
  String? password;
  String? lastLogin;
  bool isSuperuser;
  String username;
  String firstName;
  String lastName;
  String email;
  bool isStaff;
  bool isActive;
  String? dateJoined;
  String? dob;
  String? phoneNumber;
  bool isAccepted;
  bool sync;
  String role;
  int? admin;

  User({
    required this.id,
    this.password,
    this.lastLogin,
    required this.isSuperuser,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isStaff,
    required this.isActive,
    this.dateJoined,
    this.dob,
    this.phoneNumber,
    required this.isAccepted,
    required this.sync,
    required this.role,
    this.admin,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'password': password,
    'last_login': lastLogin,
    'is_superuser': isSuperuser,
    'username': username,
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'is_staff': isStaff,
    'is_active': isActive,
    'date_joined': dateJoined,
    'dob': dob,
    'phone_number': phoneNumber,
    'is_accepted': isAccepted,
    'sync': sync,
    'role': role,
    'admin': admin,
  };
}
