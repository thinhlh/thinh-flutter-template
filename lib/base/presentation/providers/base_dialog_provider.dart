import 'package:flutter/material.dart';
import 'package:tfc/base/presentation/widgets/app_dialog.dart';

abstract class DialogProvider with ChangeNotifier {
  Future<T?> showDialog<T>(BuildContext context, AlertDialog dialog) {
    return AppDialog.instance.showAppDialog<T>(context, dialog);
  }

  void dismissDialog<T>(BuildContext context, {T? result}) {
    return AppDialog.instance.dismissAppDialog(context, result: result);
  }
}
