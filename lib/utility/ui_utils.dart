import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

extension UiUtils on BuildContext {
  void showSnackbarMessage(String title) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(title),
    ));
  }
}
