import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class ShowFlushbar {
  static void showError(
    BuildContext context, {
    required String message,
    String title = 'Oops!',
  }) {
    Flushbar(
      backgroundColor: const Color(0xFFE57373), // Màu đỏ nhẹ
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(16),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      padding: const EdgeInsets.all(16),
      icon: const Icon(
        Icons.error_outline,
        color: Colors.white,
        size: 28,
      ),
      titleText: Text(
        title,
        style: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message,
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
    ).show(context);
  }

  static void showSuccess(
    BuildContext context, {
    required String message,
    String title = '',
  }) {
    Flushbar(
      backgroundColor: const Color(0xFF4CAF50), // Xanh lá (màu success)
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(16),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      padding: const EdgeInsets.all(16),
      icon: const Icon(
        Icons.check_circle_outline,
        color: Colors.white,
        size: 28,
      ),
      titleText: Text(
        title,
        style: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message,
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
    ).show(context);
  }
}
