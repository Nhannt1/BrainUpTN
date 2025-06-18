import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BtnWidget extends StatelessWidget {
  const BtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.periwinkle, AppColors.classicRose],
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.restart_alt, color: Colors.black87),
                SizedBox(
                  width: 7.w,
                ),
                Text("Restart Deck", style: TextStyle(color: AppColors.black)),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.dolly, AppColors.iceCold],
            ),
            borderRadius: BorderRadius.circular(7.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.auto_fix_high,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "Generate from Notes",
                  style: BrainUpTextStyles.text16Normal
                      .copyWith(color: AppColors.black),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Theme",
                  style: BrainUpTextStyles.text12Normal
                      .copyWith(color: AppColors.paleSky),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    ThemeCircle(color: AppColors.zumthor, isSelected: true),
                    SizedBox(width: 8),
                    ThemeCircle(color: AppColors.governorbay, isSelected: true),
                  ],
                ),
              ],
            ),
            SizedBox(width: 32),
            Column(
              children: [
                Text(
                  "Card Style",
                  style: BrainUpTextStyles.text12Normal
                      .copyWith(color: AppColors.paleSky),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    ThemeCircle(color: AppColors.zumthor, isSelected: true),
                    SizedBox(width: 8),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.wispPink,
                        border:
                            Border.all(color: AppColors.persianPink, width: 2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

Widget ThemeCircle({required Color color, bool isSelected = false}) {
  return Container(
    width: 24,
    height: 24,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
      border: Border.all(
        color: isSelected ? AppColors.melrose : AppColors.white,
        width: 2,
      ),
    ),
  );
}
