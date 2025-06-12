import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuickAccessItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const QuickAccessItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.athensGray1,
              blurRadius: 1.r,
              offset: Offset(1.r, 2.r),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 19.w),
          child: Column(
            children: [
              FaIcon(icon, color: AppColors.cornflowerBlue, size: 24.sp),
              SizedBox(height: 4.h),
              Text(label,
                  style: BrainUpTextStyles.text12Normal.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
