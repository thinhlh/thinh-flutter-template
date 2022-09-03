import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:tfc/config/colors.dart';

class UiUtils {
  static Future<void> showInfoSnackBar(
    BuildContext context, {
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 3),
    bool isError = false,
    FlushbarPosition position = FlushbarPosition.TOP,
    EdgeInsets margin = EdgeInsets.zero,
  }) async {
    await Flushbar(
      message: message,
      duration: duration,
      messageColor: AppColors.primaryLight,
      borderRadius: BorderRadius.circular(10),
      title: title,
      margin: margin,
      backgroundColor: isError ? AppColors.error : AppColors.primary,
      flushbarPosition: position,
    ).show(context);
  }
}
