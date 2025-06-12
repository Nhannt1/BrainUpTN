import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StreakCard extends StatelessWidget {
  const StreakCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.zumthor, AppColors.pattensblue]),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(top: 21.h, bottom: 21.h, left: 16.w),
              child: const Icon(FontAwesomeIcons.fire,
                  color: AppColors.corn, size: 30),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("7-Day Streak!",
                        style: BrainUpTextStyles.text16Bold
                            .copyWith(color: AppColors.governorbay)),
                    Text("Keep it up and earn bonus XP",
                        style: BrainUpTextStyles.text12Normal
                            .copyWith(color: AppColors.paleSky)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 28.h, bottom: 28.h, right: 16.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text("+15 XP",
                    style: BrainUpTextStyles.text12Bold
                        .copyWith(color: AppColors.royalBlue)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
