import 'package:brainup/domain/flashcard_model/flashcard_model.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnswerButtons extends StatelessWidget {
  final FlashcardModel currentFlashcard;
  final VoidCallback onNext;
  final Function(bool) onAnswer;

  const AnswerButtons({
    super.key,
    required this.currentFlashcard,
    required this.onNext,
    required this.onAnswer,
  });

  @override
  Widget build(BuildContext context) {
    bool hasAnswered = currentFlashcard.userAnsweredCorrectly != null;

    void _handleTap(bool userSaysTrue) {
      onAnswer(userSaysTrue); // gọi từ QuestionAi để xử lý logic
      Future.delayed(Duration(), onNext); // delay sang câu tiếp
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: hasAnswered
              ? null
              : () {
                  onAnswer(true);
                  _handleTap(true);
                },
          child: _buildButton(
            icon: FontAwesomeIcons.faceSmile,
            text: 'True',
            color: AppColors.shamrocknk,
            bgColor: AppColors.scandal,
            borderColor: AppColors.shamrocknk,
          ),
        ),
        GestureDetector(
          onTap: hasAnswered
              ? null
              : () {
                  onAnswer(false);
                  _handleTap(false);
                },
          child: _buildButton(
            icon: FontAwesomeIcons.faceFrown,
            text: "Flase",
            color: AppColors.amroonFlush,
            bgColor: AppColors.wispPink,
            borderColor: AppColors.persianPink,
          ),
        ),
      ],
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String text,
    required Color color,
    required Color bgColor,
    required Color borderColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(40.r),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            SizedBox(height: 5.h),
            Text(
              text,
              style: BrainUpTextStyles.text12Normal.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
