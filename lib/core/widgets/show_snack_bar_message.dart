import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBarMessage( String message, [bool isError = false]) {
  Get.snackbar(
    isError ? 'Error' : 'Success', // Title
    message,                      // Message
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: isError ? Colors.red : Colors.green,
    colorText: Colors.white,
    margin: const EdgeInsets.all(16),
    borderRadius: 8,
  );
}
