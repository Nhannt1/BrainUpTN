import 'package:brainup/presentation/resources/gen/colors.gen.dart';
<<<<<<< HEAD
import 'package:brainup/shared/extensions/context_ext.dart';
=======
>>>>>>> 3eed932 ([Task]#12 Create ui home screen)
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
<<<<<<< HEAD
              blurRadius: 3.r,
              offset: Offset(0, 2.r),
=======
              blurRadius: 3,
              offset: const Offset(0, 2),
>>>>>>> 3eed932 ([Task]#12 Create ui home screen)
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
<<<<<<< HEAD
                SizedBox(width: 9.w),
                Text(
                  context.l10n!.airecommends,
=======
                SizedBox(width: 9),
                Text(
                  "AI recommends",
>>>>>>> 3eed932 ([Task]#12 Create ui home screen)
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
<<<<<<< HEAD
                      text: context.l10n!.todayfocuson,
=======
                      text: "Today, focus on ",
>>>>>>> 3eed932 ([Task]#12 Create ui home screen)
                      style: BrainUpTextStyles.text14Normal
                          .copyWith(color: AppColors.paleSky),
                    ),
                    TextSpan(
<<<<<<< HEAD
                        text: context.l10n!.biology,
                        style: BrainUpTextStyles.text14Bold
                            .copyWith(color: AppColors.cornflowerBlue)),
                    TextSpan(
                      text: context.l10n!.flashcardsandtry,
=======
                        text: "Biology",
                        style: BrainUpTextStyles.text14Bold
                            .copyWith(color: AppColors.cornflowerBlue)),
                    TextSpan(
                      text:
                          " flashcards and try the new \"Photosynthesis Quiz\".",
>>>>>>> 3eed932 ([Task]#12 Create ui home screen)
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
<<<<<<< HEAD
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                child: Text(
                  context.l10n!.seedetails,
=======
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Text(
                  "See Details",
>>>>>>> 3eed932 ([Task]#12 Create ui home screen)
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
