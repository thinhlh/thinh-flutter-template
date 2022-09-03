import 'package:flutter/services.dart';

class AppValues {
  AppValues._internal();

  // UI
  static const Duration animatedDuration = Duration(milliseconds: 500);

  static const List<DeviceOrientation> deviceOrientations = [
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ];
}
