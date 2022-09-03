import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc/services/dialogs/app_dialog.dart';
import 'package:tfc/services/dialogs/widgets/w_app_loading.dart';

class AppLoading extends AppDialog {
  // Show loading dialog shortcut
  /// Change icon at https://pub.dev/packages/flutter_spinkit
  static void show(BuildContext context) {
    context.read<AppLoading>().showLoading(context);
  }

  /// Hide loading dialog shortcut
  static void dismiss(BuildContext context) {
    context.read<AppLoading>().dismissLoading();
  }

  /// Show loading dialog
  /// Change icon at https://pub.dev/packages/flutter_spinkit
  Future<void> showLoading(BuildContext context) {
    return showAppDialog(
      context,
      const WAppLoading(
        color: Colors.white,
      ),
    );
  }

  /// Hide loading dialog
  void dismissLoading() {
    return dismissAppDialog();
  }
}
