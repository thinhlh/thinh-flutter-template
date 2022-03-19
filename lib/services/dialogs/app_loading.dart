import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tfc/base/presentation/widgets/w_loading.dart';

class AppLoading {
  static BuildContext? _context;
  static bool _isShowing = false;
  AppLoading._internal();

  /// Show the dialog and store it's context for further dismiss
  static Future showLoading(BuildContext context) {
    // Dismiss the current loading first
    if (_isShowing) dismissLoading(_context!);
    _isShowing = true;
    _context = context;
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => const LoadingWidget(
        color: Colors.white,
      ),
    );
  }

  static void dismissLoading(BuildContext context) async {
    if (_context == null) {
      // Do nothing
    } else {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
        _context = null;
        _isShowing = false;
      }
    }
  }
}
