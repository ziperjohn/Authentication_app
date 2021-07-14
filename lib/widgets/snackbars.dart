import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
    snackPosition: SnackPosition.BOTTOM,
    dismissDirection: SnackDismissDirection.HORIZONTAL,
    icon: Icon(Icons.error),
    duration: Duration(seconds: 5),
    shouldIconPulse: true,
  );
}
