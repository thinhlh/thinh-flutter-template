import 'package:flutter/material.dart';
import 'package:tfc/app/common/presentation/widgets/dialog/w_error_dialog.dart';
import 'package:tfc/services/dialogs/app_dialog.dart';

abstract class DialogProvider with ChangeNotifier {
  Future showDialog(BuildContext context, WErrorDialog dialog) {
    return AppDialog.show(context, dialog);
  }

  void dismissDialog(BuildContext context) {
    return AppDialog.dismiss(context);
  }
}
