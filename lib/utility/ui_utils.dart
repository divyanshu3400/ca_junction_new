import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

extension UiUtils on BuildContext {
  void showSnackbarMessage(String title) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(title),
    ));
  }
}

Future<void> requestNotificationPermission(BuildContext context) async {
  final status = await Permission.notification.request();
  switch (status) {
    case PermissionStatus.granted:
      break;
    case PermissionStatus.denied:
      break;

    case PermissionStatus.restricted:
      break;
    case PermissionStatus.permanentlyDenied:
      break;
    case PermissionStatus.limited:
      break;
    case PermissionStatus.provisional:
      break;
  }
}
