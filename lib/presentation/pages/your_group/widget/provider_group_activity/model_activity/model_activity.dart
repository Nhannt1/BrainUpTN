import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Activity {
  final String userName;
  final String action;
  final String timeAgo;
  final IconData icon;

  Activity({
    required this.userName,
    required this.action,
    required this.timeAgo,
    required this.icon,
  });
  factory Activity.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Activity(
      userName: data['name'] ?? "",
      action: data['sub'] ?? "",
      timeAgo: data['time'] ?? "",
      icon: iconMap[data['icon']] ?? Icons.help_outline,
    );
  }
}

const iconMap = {
  'check': Icons.check,
  'book': Icons.book,
  'quiz': Icons.quiz,
  'star': Icons.star,
  // thêm icon khác nếu cần
};
