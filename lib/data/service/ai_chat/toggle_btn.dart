import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onPressed;
  final bool isLeft;

  const ToggleButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onPressed,
    required this.isLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.dodgerblue : AppColors.athensGray,
          border: Border.all(
              color: selected ? AppColors.dodgerblue : AppColors.athensGray1),
          borderRadius: BorderRadius.horizontal(
            left: isLeft ? Radius.circular(10.r) : Radius.zero,
            right: isLeft ? Radius.zero : Radius.circular(10.r),
          ),
        ),
        child: Row(
          children: [
            Icon(icon,
                size: 16.sp,
                color: selected ? AppColors.white : AppColors.riverBed),
            SizedBox(width: 4.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: selected ? AppColors.white : AppColors.riverBed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
