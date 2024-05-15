import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseServ{
  static Future<String?> getFCMToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    return token;
  }
}