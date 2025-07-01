import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Flashcard extends StatelessWidget {
  final String question;
  final String? answer;
  final bool showAnswer;
  final bool? isCorrect;
  final bool isLoading;
  const Flashcard({
    Key? key,
    required this.question,
    this.answer,
    this.showAnswer = false,
    this.isCorrect,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon = isCorrect == null
        ? FontAwesomeIcons.circleQuestion
        : isCorrect == true
            ? FontAwesomeIcons.circleCheck
            : FontAwesomeIcons.circleXmark;

    final iconColor = isCorrect == null
        ? AppColors.royalBlue
        : isCorrect == true
            ? Colors.green
            : Colors.red;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Container(
        height: 200,
        width: double.infinity,
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
        padding: EdgeInsets.all(20.w),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      question,
                      textAlign: TextAlign.center,
                      style: BrainUpTextStyles.text16Normal
                          .copyWith(color: AppColors.governorbay),
                    ),
                    SizedBox(height: 12),
                    Icon(icon, size: 32.sp, color: iconColor),
                    SizedBox(height: 12),
                    Text(
                      showAnswer
                          ? ("Answer: $answer" ?? "No answer")
                          : "Tap to reveal",
                      style: BrainUpTextStyles.text12Normal
                          .copyWith(color: AppColors.grayChateau),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
