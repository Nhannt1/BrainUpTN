import 'dart:convert';
import 'dart:ui';
import 'package:brainup/presentation/pages/home/widgets/provider_your_group/entities/hexcolor.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

final List<List<Color>> groupColors = [
  [HexColor("#E0F7FA"), HexColor("#2F80ED")],
  [HexColor("#FFF3E0"), HexColor("#FF9800")],
  [HexColor("#E8F5E9"), HexColor("#4CAF50")],
  [HexColor("#F3E5F5"), HexColor("#9C27B0")],
  [HexColor("#FBE9E7"), HexColor("#FF5722")],
];

/// Hàm hash ổn định
int stableHash(String input) {
  final bytes = utf8.encode(input);
  final digest = md5.convert(bytes); // hoặc sha1 cũng được
  return digest.bytes.fold(0, (prev, elem) => prev + elem);
}

List<Color> getGroupColors(String title) {
  final index = stableHash(title) % groupColors.length;
  return groupColors[index];
}

Color darken(Color color,
    {double amount = 0.1, double saturate = 0.1, double blendBlack = 0.15}) {
  final hsl = HSLColor.fromColor(color);

  final newLightness = (hsl.lightness - amount).clamp(0.0, 1.0);
  final newSaturation = (hsl.saturation + saturate).clamp(0.0, 1.0);

  final hslDark = hsl.withLightness(newLightness).withSaturation(newSaturation);
  final darkColor = hslDark.toColor();

  // Blend thêm 15% đen để guaranteed tối hơn 2 màu kia
  return Color.lerp(darkColor, Colors.black, blendBlack)!;
}
