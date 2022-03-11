import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._internal();

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
  );
}
