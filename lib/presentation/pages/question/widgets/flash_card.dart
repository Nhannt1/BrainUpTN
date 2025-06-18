import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Flashcard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.zumthor,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.r,
              offset: Offset(2, 6),
            )
          ],
        ),
        padding: EdgeInsets.all(30.w),
        child: Column(
          children: [
            Text(
              "What is the powerhouse of the cell?",
              textAlign: TextAlign.center,
              style: BrainUpTextStyles.text16Normal
                  .copyWith(color: AppColors.governorbay),
            ),
            SizedBox(height: 12),
            Icon(FontAwesomeIcons.circleQuestion,
                size: 32.sp, color: AppColors.royalBlue),
            SizedBox(height: 12),
            Text(
              "Tap to reveal",
              style: BrainUpTextStyles.text12Normal
                  .copyWith(color: AppColors.grayChateau),
            ),
          ],
        ),
      ),
    );
  }
}
