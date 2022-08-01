import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  static dialogLoading() {}

  static dialogWithRoute(
    String title,
    message,
    text, {
    VoidCallback? onTap,
  }) {
    return Get.defaultDialog(
      title: title,
      middleText: message,
      textConfirm: text ?? "Tutup",
      onConfirm: onTap ?? () => Get.back(),
    );
  }
}
