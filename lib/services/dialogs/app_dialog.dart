import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc/app/common/presentation/widgets/dialog/w_error_dialog.dart';

class AppDialog {
  BuildContext? _context;
  bool isShowing = false;

  /// Show the dialog and store it's context for further dismiss
  static Future show(BuildContext context, WErrorDialog dialog,
      {bool dismissible = false}) async {
    // await Future.delayed(const Duration(milliseconds: 500));
    return context
        .read<AppDialog>()
        .showAppDialog(context, dialog, dismissble: dismissible);
  }

  static void dismiss(BuildContext context) async {
    context.read<AppDialog>().dismissAppDialog();
  }

  Future showAppDialog(BuildContext context, Widget dialog,
      {bool dismissble = false}) {
    dismissAppDialog();
    isShowing = true;
    return showDialog(
      context: context,
      barrierDismissible: dismissble,
      builder: (dialogContext) {
        if (!isShowing) {
          dismissAppDialog();
        } else {
          _context = dialogContext;
        }
        return dialog;
      },
    ).then((value) {
      _context = null;
      isShowing = false;
    });
  }

  void dismissAppDialog() {
    isShowing = false;
    if (_context != null) {
      try {
        if (Navigator.canPop(_context!)) {
          Navigator.of(_context!).pop(true);
        }
      } catch (e) {
        // Unhandled Exception: Looking up a deactivated widget's ancestor is unsafe.
      } finally {
        _context = null;
      }
    }
  }
}
