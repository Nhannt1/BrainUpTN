import 'package:flutter/material.dart';

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor'; // thêm alpha
    }
    return int.parse(hexColor, radix: 16);
  }

  static Color fromHex(String hexColor) => HexColor(hexColor);
}
