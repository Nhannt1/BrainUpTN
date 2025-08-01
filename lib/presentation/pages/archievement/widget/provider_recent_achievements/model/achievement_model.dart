import 'package:flutter/material.dart';

class AchievementModel {
  final String title;
  final String description;
  final String timeAgo;
  final int points;
  final IconData icon;
  final Color backgroundColor;

  AchievementModel({
    required this.title,
    required this.description,
    required this.timeAgo,
    required this.points,
    required this.icon,
    required this.backgroundColor,
  });
}
