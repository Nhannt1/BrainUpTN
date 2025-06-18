import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  const ProgressBarWidget({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });

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
            const Icon(Icons.pause_circle_outline, size: 20),
            const SizedBox(width: 4),
            const Text("Pause"),
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
