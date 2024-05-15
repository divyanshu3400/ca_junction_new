
import 'package:floor/floor.dart';

@entity
class CountryModel {

  @primaryKey
  int id;

  String country;
  String countryCode;
  bool sync;

  CountryModel({
    required this.id,
    required this.country,
    required this.countryCode,
    required this.sync,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      country: json['country'],
      countryCode: json['country_code'],
      sync: json['sync'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    data['sync'] = this.sync;
    return data;
  }
}
