import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectGroup extends StatelessWidget {
  const SelectGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Your Groups",
                  style: BrainUpTextStyles.text16Bold.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.w500)),
              Text(
                "View All",
                style: BrainUpTextStyles.text12Bold.copyWith(
                  color: AppColors.cornflowerBlue,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              GroupCard(
                icon: FontAwesomeIcons.flask,
                title: "Biology",
                textColor: AppColors.salem,
                subtitle: "12 members",
                backgroundColor: [AppColors.feta, AppColors.iceCold],
                iconColor: AppColors.salem,
              ),
              SizedBox(width: 12),
              GroupCard(
                icon: FontAwesomeIcons.calculator,
                title: "Math Study",
                textColor: AppColors.amroonFlush,
                subtitle: "8 members",
                backgroundColor: [
                  AppColors.carouselPink,
                  AppColors.classicRose
                ],
                iconColor: AppColors.amroonFlush,
              ),
              SizedBox(width: 12),
              GroupCard(
                icon: FontAwesomeIcons.book,
                title: "Literature",
                textColor: AppColors.richGold,
                subtitle: "5 members",
                backgroundColor: [AppColors.orangeWhite, AppColors.dolly],
                iconColor: AppColors.richGold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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
      padding: EdgeInsets.all(12.h),
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
