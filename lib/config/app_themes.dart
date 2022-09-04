import 'package:flutter/material.dart';
import 'package:tfc/config/app_sizes.dart';
import 'package:tfc/config/colors.dart';

class AppTheme {
  AppTheme._internal();

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primary),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: AppSizes.largeWidthDimens,
            vertical: AppSizes.largeHeightDimens,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.mediumRadius),
          ),
        ),
      ),
    ),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
  );
}
