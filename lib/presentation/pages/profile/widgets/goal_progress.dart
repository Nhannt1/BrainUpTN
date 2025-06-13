import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalProgress extends StatelessWidget {
  final String title;
  final int current;
  final int total;
  final List<Color> color;
  final Color totalColor;

  const GoalProgress({
    required this.title,
    required this.current,
    required this.total,
    required this.color,
    required this.totalColor,
  });

  @override
  Widget build(BuildContext context) {
    double percent = current / total;
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: BrainUpTextStyles.text14Normal.copyWith(
                  color: AppColors.eastBay,
                ),
              ),
              Text(
                "$current/$total",
                style: BrainUpTextStyles.text12Bold
                    .copyWith(color: totalColor, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(999.r),
            child: Container(
              height: 12.h,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.athensGray1,
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: percent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999.r),
                        gradient: LinearGradient(
                          colors: color,
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
      ),
    );
  }
}
