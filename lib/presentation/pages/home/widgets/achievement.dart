<<<<<<< HEAD
import 'package:brainup/presentation/pages/home/widgets/achievement_icon.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/extensions/context_ext.dart';
=======
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
>>>>>>> 3eed932 ([Task]#12 Create ui home screen)
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AchievementsSection extends StatelessWidget {
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
              Text(
<<<<<<< HEAD
                context.l10n!.achievements,
                style: BrainUpTextStyles.text16Bold.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
              Text(context.l10n!.viewall,
=======
                'Achievements',
                style: BrainUpTextStyles.text16Bold.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
              Text('See All',
>>>>>>> 3eed932 ([Task]#12 Create ui home screen)
                  style: BrainUpTextStyles.text12Bold
                      .copyWith(color: AppColors.cornflowerBlue)),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              AchievementIcon(
                icon: FontAwesomeIcons.medal,
                backgroundColor: [AppColors.melrose, AppColors.cornflowerBlue],
              ),
              SizedBox(width: 8.w),
              AchievementIcon(
                icon: FontAwesomeIcons.trophy,
                backgroundColor: [AppColors.lavenderPink, AppColors.frenchRose],
              ),
              SizedBox(width: 8.w),
              AchievementIcon(
                icon: FontAwesomeIcons.solidStar,
<<<<<<< HEAD
                backgroundColor: [AppColors.brightSun, AppColors.corn],
=======
                backgroundColor: [AppColors.rightSun, AppColors.corn],
>>>>>>> 3eed932 ([Task]#12 Create ui home screen)
              ),
            ],
          ),
        )
      ],
    );
  }
}
<<<<<<< HEAD
=======

class AchievementIcon extends StatelessWidget {
  final IconData icon;
  final List<Color> backgroundColor;

  const AchievementIcon({
    super.key,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
>>>>>>> 3eed932 ([Task]#12 Create ui home screen)
