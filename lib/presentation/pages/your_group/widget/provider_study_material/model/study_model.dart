import 'package:flutter/material.dart';

class StudyMaterial {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final String subtitle;
  StudyMaterial({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    required this.subtitle,
  });

  StudyMaterial copyWith({
    IconData? icon,
    Color? iconColor,
    Color? iconBg,
    String? title,
    String? subtitle,
  }) {
    return StudyMaterial(
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
      iconBg: iconBg ?? this.iconBg,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
    );
  }
}
