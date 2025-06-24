import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckInfoSection extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  const DeckInfoSection(
      {super.key, required this.currentQuestion, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    final progress = currentQuestion / totalQuestions;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.layers,
                  color: AppColors.cornflowerBlue,
                ),
                SizedBox(width: 4.w),
                Text(
                  "Deck: Biology",
                  style: BrainUpTextStyles.text14Normal
                      .copyWith(color: AppColors.paleSky),
                ),
              ],
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.zumthor),
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.athensGray1,
                          blurRadius: 1.r,
                          offset: Offset(1, 1))
                    ]),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 13.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.shuffle,
                        size: 20.sp,
                        color: AppColors.governorbay,
                      ),
                      Text(
                        "Shuffle",
                        style: BrainUpTextStyles.text12Normal
                            .copyWith(color: AppColors.governorbay),
                      ),
                    ],
                  ),
                )),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: AppColors.zumthor,
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progress,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: [
                          AppColors.cornflowerBlue,
                          AppColors.persianPink
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "$currentQuestion / $totalQuestions",
              style: BrainUpTextStyles.text12Normal
                  .copyWith(color: AppColors.royalBlue),
            ),
          ],
        ),
      ],
    );
  }
}
