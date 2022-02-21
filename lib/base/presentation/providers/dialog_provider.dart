import 'package:flutter/material.dart';
import 'package:tfc/services/dialogs/app_dialog.dart';

abstract class DialogProvider with ChangeNotifier {
  Future<T?> showDialog<T>(BuildContext context, AlertDialog dialog) {
    return AppDialog.showAppDialog<T>(context, dialog);
  }

  void dismissDialog<T>(BuildContext context, {T? result}) {
    return AppDialog.dismissAppDialog(context, result: result);
  }
}
