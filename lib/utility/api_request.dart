import 'dart:convert';
import 'package:ca/utility/constants.dart';
import 'package:ca/utility/shared_pref.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'hive_service.dart';

Future<dynamic> postRequest(String endPoint, Map<String, dynamic> data) async {
  String apiUrl = '$BASE_URL$endPoint/';
  String requestBody = jsonEncode(data);
  try {
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: requestBody,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      final userData = json.decode(jsonData['data']);
      SharedPref.storeString(token, jsonData['token']);
      HiveService().putData(userDataKey, userData);
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  } catch (e) {}
}

Future<bool> fetchUserDashboardStats(int? userId) async {
  const apiUrl = '$BASE_URL/api/users/';
  try {
    final http.Response response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final box = await Hive.openBox(userBox);
      box.put(userDashboardStats, responseData);
      return true;
    } else {
      return false;
    }
  } catch (error) {
    throw error.toString();
  }
}


Future<dynamic> makePostRequest(String endPoint,Map<String,dynamic> data) async {
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
