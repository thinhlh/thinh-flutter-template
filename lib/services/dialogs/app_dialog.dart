import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc/app/common/presentation/widgets/dialog/w_error_dialog.dart';

class AppDialog {
  BuildContext? _context;

  /// Show the dialog and store it's context for further dismiss
  static Future show(
    BuildContext context,
    WErrorDialog dialog,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return context.read<AppDialog>().showAppDialog(context, dialog);
  }

  static void dismiss(BuildContext context) async {
    context.read<AppDialog>().dismissAppDialog();
  }

  Future showAppDialog(BuildContext context, Widget dialog) {
    dismissAppDialog();
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        _context = dialogContext;
        return dialog;
      },
    );
  }

  void dismissAppDialog() {
    if (_context != null) {
      try {
        if (Navigator.canPop(_context!)) {
          Navigator.pop(_context!);
        }
      } catch (e) {
        // Unhandled Exception: Looking up a deactivated widget's ancestor is unsafe.
      } finally {
        _context = null;
      }
    }
  }
}
