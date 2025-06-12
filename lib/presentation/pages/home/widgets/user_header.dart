import 'package:brainup/data/repository/source/local/user_local_data_source.dart';
import 'package:brainup/di/di.dart';
import 'package:brainup/presentation/pages/login/login_page.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserHeader extends StatelessWidget {
  final UserLocalDataSource userLocal = getIt<UserLocalDataSource>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.athensGray1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: AppColors.cornflowerBlue, width: 2.w),
                ),
                child: const CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                    'https://i.imgur.com/QCNbOAo.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Good afternoon,',
                      style: BrainUpTextStyles.text12Normal
                          .copyWith(color: AppColors.grayChateau)),
                  Text('Sara Lee',
                      style: BrainUpTextStyles.text16Bold
                          .copyWith(color: AppColors.black)),
                ],
              ),
            ),
            Stack(
              children: [
                InkWell(
                  onTap: () async {
                    await userLocal.saveHasLogin(hasLogin: false);
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.remove('hasShownWelcomePopup');
                    context.go(LoginPage.rootLocation);
                  },
                  child: Icon(Icons.notifications_none,
                      color: Colors.blue, size: 30.sp),
                ),
                Positioned(
                  right: 2.w,
                  top: 2.h,
                  child: Container(
                    width: 10.w,
                    height: 10.w,
                    decoration: const BoxDecoration(
                      color: AppColors.flamingo,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
