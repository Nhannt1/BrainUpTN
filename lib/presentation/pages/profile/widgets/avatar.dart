import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 24.h),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 112.w,
                  height: 112.h,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(9999.r)),
                  child: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: CircleAvatar(
                      radius: 40.r,
                      backgroundImage:
                          NetworkImage('https://i.imgur.com/QCNbOAo.png'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  right: 10.w,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.white),
                    child: Padding(
                      padding: EdgeInsets.all(2.w),
                      child: CircleAvatar(
                        radius: 14.r,
                        backgroundColor: AppColors.cornflowerBlue,
                        child: Icon(Icons.camera_alt,
                            size: 14.sp, color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.gold, AppColors.orangepeel]),
                borderRadius: BorderRadius.circular(999.r),
              ),
              child: Text('Premium',
                  style: BrainUpTextStyles.text12Bold
                      .copyWith(color: AppColors.cloudBurstl)),
            )
          ],
        ),
      ),
    );
  }
}
