import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckInfoSection extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;
  final VoidCallback onReset;
  final String selectedSubject;
  final Function(String) onSubjectChanged;
  final bool isLoading;
  const DeckInfoSection(
      {super.key,
      required this.currentQuestion,
      required this.totalQuestions,
      required this.onReset,
      required this.selectedSubject,
      required this.onSubjectChanged,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final progress = currentQuestion / totalQuestions;
    final subjects = [
      "Toán Học",
      "Văn Học",
      "Tiếng Anh",
      "Lịch Sử",
      "Địa lý",
      "Hóa Học",
      "Sinh Học",
      "Vật Lý"
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                DropdownButton<String>(
                  value: selectedSubject,
                  icon: Icon(Icons.arrow_drop_down),
                  style: BrainUpTextStyles.text14Normal
                      .copyWith(color: AppColors.paleSky),
                  underline: SizedBox(),
                  onChanged: (value) {
                    if (value != null) onSubjectChanged(value);
                  },
                  items: subjects.map((subject) {
                    return DropdownMenuItem(
                      value: subject,
                      child: Row(
                        children: [
                          Icon(Icons.layers,
                              color: AppColors.cornflowerBlue, size: 25),
                          SizedBox(width: 4),
                          Text("  $subject"),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            GestureDetector(
              onTap: onReset,
              child: Container(
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
            ),
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
