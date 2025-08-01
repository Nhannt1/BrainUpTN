import 'dart:ui';

import 'package:brainup/presentation/pages/home/widgets/provider_your_group/entities/hexcolor.dart';

class GroupModel {
  final String title;
  final String icon;
  final int members;

  GroupModel({
    required this.title,
    required this.icon,
    required this.members,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      title: json['title'] ?? '',
      icon: json['icon'] ?? 'book',
      members: int.tryParse(json['member']?.toString() ?? '') ?? 0,
    );
  }
}
