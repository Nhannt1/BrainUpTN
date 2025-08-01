import 'package:brainup/presentation/pages/archievement/archivement_page.dart';
import 'package:brainup/presentation/pages/home/widgets/achievement_icon.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/extensions/context_ext.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

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
                context.l10n!.achievements,
                style: BrainUpTextStyles.text16Bold.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
              Text(context.l10n!.viewall,
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
                ontap: () {
                  context.push(AchievementsPage.rootLocation);
                },
                icon: FontAwesomeIcons.medal,
                backgroundColor: [AppColors.melrose, AppColors.cornflowerBlue],
              ),
              SizedBox(width: 8.w),
              AchievementIcon(
                ontap: () {},
                icon: FontAwesomeIcons.trophy,
                backgroundColor: [AppColors.lavenderPink, AppColors.frenchRose],
              ),
              SizedBox(width: 8.w),
              AchievementIcon(
                ontap: () {},
                icon: FontAwesomeIcons.solidStar,
                backgroundColor: [AppColors.brightSun, AppColors.corn],
              ),
            ],
          ),
        )
      ],
    );
  }
}
