import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BadgeModel {
  final String title;
  final IconData icon;
  final List<Color> gradientColors;

  BadgeModel({
    required this.title,
    required this.icon,
    required this.gradientColors,
  });
}
