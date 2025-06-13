import 'package:brainup/presentation/pages/profile/widgets/goal_progress.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LearningGoals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Card(
        color: AppColors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.track_changes, color: AppColors.cornflowerblue),
                  SizedBox(width: 8.w),
                  Text("Learning Goals",
                      style: BrainUpTextStyles.text16Bold
                          .copyWith(color: AppColors.cloudBurstl)),
                ],
              ),
              SizedBox(height: 16),
              GoalProgress(
                  title: "Read 20 books in 2024",
                  current: 8,
                  total: 20,
                  totalColor: AppColors.cornflowerblue,
                  color: [AppColors.cornflowerBlue, AppColors.turquoise]),
              GoalProgress(
                  title: "Complete 50 coding challenges",
                  current: 32,
                  total: 50,
                  totalColor: AppColors.salmon,
                  color: [AppColors.salmon, AppColors.gold]),
              SizedBox(height: 12.h),
              Center(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.whiteLilac,
                      border: Border.all(color: AppColors.athensGray1)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.cornflowerblue,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(
                          "Add New Goal",
                          style: BrainUpTextStyles.text12Bold
                              .copyWith(color: AppColors.cornflowerBlue),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
