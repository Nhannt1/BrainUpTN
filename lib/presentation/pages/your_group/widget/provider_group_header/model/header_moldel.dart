// lib/models/group_header_model.dart
import 'package:flutter/material.dart';

class GroupHeaderModel {
  final String subjectName;
  final String grade;
  final String topic;
  final Color startColor;
  final Color endColor;

  GroupHeaderModel({
    required this.subjectName,
    required this.grade,
    required this.topic,
    required this.startColor,
    required this.endColor,
  });

  factory GroupHeaderModel.fromJson(Map<String, dynamic> json) {
    return GroupHeaderModel(
      subjectName: json['subjectName'] ?? '',
      grade: json['grade'] ?? '',
      topic: json['topic'] ?? '',
      startColor: _colorFromHex(json['startColor']),
      endColor: _colorFromHex(json['endColor']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subjectName': subjectName,
      'grade': grade,
      'topic': topic,
      'startColor': _colorToHex(startColor),
      'endColor': _colorToHex(endColor),
    };
  }

  static Color _colorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse("0x$hexColor"));
  }

  static String _colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }
}
