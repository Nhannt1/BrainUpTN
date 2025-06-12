import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Color> backgroundColor;
  final Color iconColor;
  final Color textColor;

  const GroupCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.athensGray1,
            blurRadius: 3.r,
            offset: Offset(0.r, 2.r),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 24.sp),
          SizedBox(
            height: 8.h,
          ),
          Text(
            title,
            style: BrainUpTextStyles.text12Bold.copyWith(color: textColor),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: BrainUpTextStyles.text10Normal
                .copyWith(color: AppColors.paleSky),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
