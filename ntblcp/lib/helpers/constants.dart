import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Constants {
  static Color PrimaryColor = Color.fromARGB(255, 29, 66, 30);
}

class NotificationService {
  static void showNotificationToast(BuildContext context, String message,
      String title, NotificationTypes type) {
    Flushbar(
      title: title,
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 2),
      backgroundColor: type == NotificationTypes.error
          ? Colors.red
          : type == NotificationTypes.good
              ? Colors.grey
              : Colors.green,
    ).show(context);
  }
}

enum NotificationTypes { error, good, none }
