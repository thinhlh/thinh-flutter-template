import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfc/base/presentation/widgets/w_loading.dart';
import 'package:tfc/services/dialogs/app_dialog.dart';

class AppLoading extends AppDialog {
  // Show loading dialog shortcut
  /// Change icon at https://pub.dev/packages/flutter_spinkit
  static void show(BuildContext context) {
    context.read<AppLoading>().showLoading(context);
  }

  /// Hide loading dialog shortcut
  static void dismiss(BuildContext context) {
    context.read<AppLoading>().dismissAppDialog();
  }

  /// Show loading dialog
  /// Change icon at https://pub.dev/packages/flutter_spinkit
  Future<void> showLoading(BuildContext context) async {
    return showAppDialog(
      context,
      const WLoading(
        color: Colors.white,
      ),
    );
  }

  /// Hide loading dialog
  void dismissLoading() {
    dismissAppDialog();
  }
}
