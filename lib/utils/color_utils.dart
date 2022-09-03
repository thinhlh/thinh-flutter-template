import 'package:flutter/material.dart';

abstract class ColorUtils {
  static Color getColorFromHex(String? hexColor) {
    if (hexColor != null) {
      hexColor = hexColor.toUpperCase().replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "FF$hexColor";
      }
      if (int.tryParse(hexColor, radix: 16) != null) {
        return Color(int.tryParse(hexColor, radix: 16)!);
      }
    }
    return Colors.black;
  }

  static String getStringColor(Color color) {
    return color.value.toRadixString(16);
  }
}
