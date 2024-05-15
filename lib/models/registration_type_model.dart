import 'package:floor/floor.dart';

@entity
class RegistrationType {
  @primaryKey
  int? id;

  String? type;

  bool? sync;

  RegistrationType(this.id, this.type, this.sync);

  factory RegistrationType.fromJson(Map<String, dynamic> json) {
    return RegistrationType(
      json['id'],
      json['registration_type'],
      json['sync'],
    );
  }
}
