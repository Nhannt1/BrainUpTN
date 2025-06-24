import 'dart:io';

import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserMessage extends StatelessWidget {
  final String text;
  final String time;
  final File? imageFile;
  const UserMessage(
      {required this.text,
      required this.time,
      super.key,
      required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(
          left: 100.w,
          top: 12.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.solitude,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (imageFile != null) ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.file(
                        imageFile!,
                        width: 150.w,
                        height: 150.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                  if (text.isNotEmpty) Text(text),
                  SizedBox(height: 4.h),
                  Text(time, style: TextStyle(fontSize: 10.sp)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
