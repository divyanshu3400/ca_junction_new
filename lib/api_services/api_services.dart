import 'dart:convert';
import 'package:ca/models/registration_type_model.dart';
import 'package:ca/models/role_model.dart';
import 'package:ca/utility/constants.dart';
import 'package:ca/utility/shared_pref.dart';
import 'package:core/core.dart';
import 'package:http/http.dart' as http;
import '../database/database_service.dart';


class APIServices{

  static fetchRoles() async{
    final response = await http.get(Uri.parse('${BASE_URL}route/roles/'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Role> roles = data.map((tagTypeJson) => Role.fromJson(tagTypeJson)).toList();
      await DatabaseService.database.roleDao.insertRoles(roles);
      return roles;
    } else {
      throw Exception('Failed to load roles from server');
    }
  }
  static fetchRegistrationType() async{
    final response = await http.get(Uri.parse('${BASE_URL}route/userregistrationtype/'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<RegistrationType> roles = data.map((registrationJson) => RegistrationType.fromJson(registrationJson)).toList();
      await DatabaseService.database.registrationTypeDao.insertAllRegistrationTypes(roles);
      return roles;
    } else {
      throw Exception('Failed to load roles from server');
    }
  }

  static Future<dynamic> makePostRequest(String endPoint,Map<String,dynamic> data) async {
    String apiUrl = '$BASE_URL$endPoint';
    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(data),
        headers: {'Content-Type': 'application/json'},
      );
      return jsonDecode(response.body);
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<List<dynamic>> fetchClients(String authToken) async {
    const String apiUrl = '${BASE_URL}api/admin/clients/';
    int? id = SharedPref.getInt(userId);
    Map<String, dynamic> data = {
      "admin_id": id
    };
    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(data),
      headers: <String, String>{'Content-Type': 'application/json',
        'Authorization': 'Token $authToken',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> clientsData = jsonDecode(response.body)['data'];
      return clientsData;
    } else {
      throw Exception('Failed to load clients');
    }
  }

  static Future<dynamic> makeGetRequest(String endPoint) async {
    String apiUrl = '$BASE_URL$endPoint';
    try {
      final http.Response response = await http.get(Uri.parse(apiUrl));
      return json.decode(response.body);
    } catch (error) {
      throw error.toString();
    }
  }
}