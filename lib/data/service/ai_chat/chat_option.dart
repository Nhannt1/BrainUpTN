import 'package:flutter/material.dart';
import 'package:brainup/data/source/local/app_database.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatOptionsMenu extends StatelessWidget {
  final VoidCallback onClearChat;

  const ChatOptionsMenu({
    Key? key,
    required this.onClearChat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(
            details.globalPosition.dx,
            details.globalPosition.dy,
            0,
            0,
          ),
          items: [
            PopupMenuItem<String>(
              value: 'clear',
              child: Text(
                'Deleted',
                style: TextStyle(color: AppColors.cinnabar),
              ),
            ),
          ],
        ).then((value) {
          if (value == 'clear') {
            onClearChat();
          }
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Icon(Icons.more_vert, color: AppColors.black),
      ),
    );
  }
}
