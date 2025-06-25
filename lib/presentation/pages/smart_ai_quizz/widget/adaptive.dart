import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Adaptive extends StatelessWidget {
  const Adaptive({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.zumthor),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FontAwesomeIcons.bolt,
                      color: AppColors.royalBlue,
                      size: 12,
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    Text(
                      "Adaptive AI: Questions adjust to your skill!",
                      style: BrainUpTextStyles.text12Normal
                          .copyWith(color: AppColors.royalBlue),
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 5.h,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FontAwesomeIcons.fire,
                    color: AppColors.corn,
                    size: 13,
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  Text(
                    "Keep your streak! 3 correct in a row = bonus XP",
                    style: BrainUpTextStyles.text12Normal
                        .copyWith(color: AppColors.grayChateau),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
