import 'package:flutter/material.dart';
import 'package:brainup/domain/ai_entity/app_database.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';

class ChatOptionsMenu extends StatelessWidget {
  final AppDatabase db;
  final String userId;
  final VoidCallback onClearChat;

  const ChatOptionsMenu({
    Key? key,
    required this.db,
    required this.userId,
    required this.onClearChat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.more_vert,
      ),
      onSelected: (value) async {
        if (value == 'clear') {
          await db.deleteMessages(userId);
          onClearChat();
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          value: 'clear',
          child: Text(
            'Deleted',
            style: TextStyle(color: AppColors.cinnabar),
          ),
        ),
      ],
    );
  }
}
