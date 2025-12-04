import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertHelper {
  static void success(String title, String message) {
    _showSnackbar(
      title,
      message,
      Colors.greenAccent.withOpacity(0.3),
      Colors.greenAccent,
    );
  }

  static void error(String title, String message) {
    _showSnackbar(
      title,
      message,
      Colors.redAccent.withOpacity(0.3),
      Colors.redAccent,
    );
  }

  static void warning(String title, String message) {
    _showSnackbar(
      title,
      message,
      Colors.orangeAccent.withOpacity(0.3),
      Colors.orangeAccent,
    );
  }

  static void info(String title, String message) {
    _showSnackbar(
      title,
      message,
      Colors.blueAccent.withOpacity(0.3),
      Colors.blueAccent,
    );
  }

  static void _showSnackbar(
      String title, String message, Color bg, Color borderColor) {
    Get.snackbar(
      title,
      message,
      margin: const EdgeInsets.all(16),
      colorText: Colors.white,
      backgroundColor: bg,
      borderRadius: 14,
      snackPosition: SnackPosition.TOP,
      borderColor: borderColor,
      borderWidth: 1.2,
      duration: const Duration(seconds: 3),
    );
  }
}
