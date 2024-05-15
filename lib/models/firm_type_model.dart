import 'package:floor/floor.dart';

@entity
class FirmType {
  @primaryKey
  int id;
  String firm;
  String description;

  FirmType({
    required this.id,
    required this.firm,
    required this.description,
  });

  factory FirmType.fromJson(Map<String, dynamic> json) {
    return FirmType(
      id: json['id'],
      firm: json['firm'],
      description: json['desc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firm': firm,
      'desc': description,
    };
  }
}
