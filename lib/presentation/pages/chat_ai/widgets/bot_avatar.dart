import 'package:brainup/data/service/ai_chat/typing_dot.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypingIndicatorBubble extends StatelessWidget {
  const TypingIndicatorBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 16.r,
          backgroundImage: NetworkImage(
            'https://cdn.dribbble.com/userupload/12555912/file/original-51980659d015ade101860977adaaa345.png?resize=752x&vertical=center',
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: TypingDots(),
        ),
      ],
    );
  }
}
