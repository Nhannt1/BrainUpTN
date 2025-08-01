import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AchievementIcon extends StatelessWidget {
  final IconData icon;
  final List<Color> backgroundColor;
  final VoidCallback ontap;
  const AchievementIcon({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: backgroundColor,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 18.sp,
          ),
        ),
      ),
    );
  }
}
