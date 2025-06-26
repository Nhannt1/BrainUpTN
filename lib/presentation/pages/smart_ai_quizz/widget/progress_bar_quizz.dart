// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';

class ProgressBarWidget extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;
  final VoidCallback ontapReset;
  const ProgressBarWidget({
    Key? key,
    required this.currentQuestion,
    required this.totalQuestions,
    required this.ontapReset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = currentQuestion / totalQuestions;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              'Question $currentQuestion / $totalQuestions',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            GestureDetector(
              onTap: ontapReset,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.brightTurquoise,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.rotateRight,
                          size: 15, color: AppColors.white),
                      SizedBox(width: 4),
                      Text("Reset",
                          style: BrainUpTextStyles.text12Bold
                              .copyWith(color: AppColors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            height: 10,
            decoration: BoxDecoration(
              color: AppColors.athensGray1,
            ),
            child: Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.cornflowerBlue,
                          AppColors.brightTurquoise
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
