import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishCardAi extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final VoidCallback onRetry;

  FinishCardAi({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.emoji_events, color: AppColors.gold, size: 60),
            const SizedBox(height: 16),
            const Text(
              "Success 🎉",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "You answered correctly $correctAnswers / $totalQuestions ",
              style: TextStyle(fontSize: 16.sp, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onRetry();
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: AppColors.black,
                  ),
                  label: const Text(
                    "Replay",
                    style: TextStyle(color: AppColors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.cerulean,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                  label: const Text("Exit"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.cinnabar,
                    side: const BorderSide(color: AppColors.cinnabar),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
