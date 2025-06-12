import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/extensions/context_ext.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AiRecommendCard extends StatelessWidget {
  const AiRecommendCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.athensGray1,
              blurRadius: 3.r,
              offset: Offset(0, 2.r),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.wandMagicSparkles,
                  color: AppColors.cornflowerBlue,
                  size: 18.sp,
                ),
                SizedBox(width: 9.w),
                Text(
                  context.l10n!.airecommends,
                  style: BrainUpTextStyles.text20Bold.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: context.l10n!.todayfocuson,
                      style: BrainUpTextStyles.text14Normal
                          .copyWith(color: AppColors.paleSky),
                    ),
                    TextSpan(
                        text: context.l10n!.biology,
                        style: BrainUpTextStyles.text14Bold
                            .copyWith(color: AppColors.cornflowerBlue)),
                    TextSpan(
                      text: context.l10n!.flashcardsandtry,
                      style: BrainUpTextStyles.text14Normal
                          .copyWith(color: AppColors.paleSky),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.zumthor),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                child: Text(
                  context.l10n!.seedetails,
                  style: BrainUpTextStyles.text12Bold
                      .copyWith(color: AppColors.cornflowerBlue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
