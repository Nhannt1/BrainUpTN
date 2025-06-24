import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowFlushbar {
  static void showError(
    BuildContext context, {
    required String message,
    String title = 'Oops!',
  }) {
    Flushbar(
      backgroundColor: AppColors.cinnabar, // Màu đỏ nhẹ
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(16.r),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      padding: EdgeInsets.all(16.r),
      icon: Icon(
        Icons.error_outline,
        color: AppColors.white,
        size: 28.sp,
      ),
      titleText: Text(
        title,
        style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.white,
            fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message,
        style: TextStyle(fontSize: 14.sp, color: AppColors.white),
      ),
      duration: Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 500),
    ).show(context);
  }

  static void showSuccess(
    BuildContext context, {
    required String message,
    String title = 'Successsful',
  }) {
    Flushbar(
      backgroundColor: AppColors.shamrocknk,
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(16.r),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      padding: EdgeInsets.all(16.r),
      icon: Icon(
        Icons.check_circle_outline,
        color: AppColors.white,
        size: 28.sp,
      ),
      titleText: Text(
        title,
        style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.white,
            fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message,
        style: TextStyle(fontSize: 14.sp, color: AppColors.white),
      ),
      duration: Duration(seconds: 3),
      animationDuration: Duration(milliseconds: 500),
    ).show(context);
  }
}
