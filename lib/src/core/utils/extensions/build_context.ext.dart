import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  double get deviceHeight => MediaQuery.of(this).size.height;

  double get deviceWidth => MediaQuery.of(this).size.width;

  void showCustomSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: AppColor.primaryBlack),
        ),
        backgroundColor: isError ? Colors.redAccent : AppColor.primaryColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
