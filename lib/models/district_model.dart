import 'package:floor/floor.dart';

@entity
class DistrictModel {

  @primaryKey
  int id;
  String district;
  bool sync;
  int state;

  DistrictModel({
    required this.id,
    required this.district,
    required this.sync,
    required this.state,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) {
    return DistrictModel(
      id: json['id'],
      district: json['district'],
      sync: json['sync'],
      state: json['state'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['district'] = this.district;
    data['sync'] = this.sync;
    data['state'] = this.state;
    return data;
  }
}
