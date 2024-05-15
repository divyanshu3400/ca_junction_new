import 'package:floor/floor.dart';

@entity
class Role {
  String? role;

  @primaryKey
  String? roleCode;

  bool? sync;

  Role({this.role, this.roleCode, this.sync});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      role: json['role'],
      roleCode: json['role_code'],
      sync: json['sync'],
    );
  }

  @override
  String toString() {
    return '$role ($roleCode)';
  }
}
