import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 15.r, child: Icon(Icons.person, size: 20.sp)),
        SizedBox(width: 8.w),
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: AppColors.athensGray,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Dot(),
              SizedBox(width: 4.w),
              Dot(),
              SizedBox(width: 4.w),
              Dot(),
            ],
          ),
        ),
      ],
    );
  }
}

Widget Dot() {
  return Container(
    width: 6.w,
    height: 6.h,
    decoration: const BoxDecoration(
      color: Colors.grey,
      shape: BoxShape.circle,
    ),
  );
}
