
import 'package:floor/floor.dart';

@entity
class StateModel {
  @primaryKey
  int id;

  String state;
  bool sync;
  int country;

  StateModel({
    required this.id,
    required this.state,
    required this.sync,
    required this.country,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      id: json['id'],
      state: json['state'] as String,
      sync: json['sync'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state'] = this.state;
    data['sync'] = this.sync;
    data['country'] = this.country;
    return data;
  }
}
