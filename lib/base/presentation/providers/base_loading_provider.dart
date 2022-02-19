import 'package:flutter/material.dart';
import 'package:tfc/base/presentation/providers/base_dialog_provider.dart';

abstract class LoadingProvider extends DialogProvider {
  bool isLoading = false;

  void showLoading(bool show) {
    isLoading = true;
    notifyListeners();
  }
}
