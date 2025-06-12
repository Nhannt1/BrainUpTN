import 'package:brainup/presentation/pages/home/widgets/achievement.dart';
import 'package:brainup/presentation/pages/home/widgets/ai_recommend.dart';
import 'package:brainup/presentation/pages/home/widgets/popup_welcome.dart';
import 'package:brainup/presentation/pages/home/widgets/quick_access.dart';
import 'package:brainup/presentation/pages/home/widgets/select_group.dart';
import 'package:brainup/presentation/pages/home/widgets/streak_card.dart';
import 'package:brainup/presentation/pages/home/widgets/user_header.dart';
import 'package:brainup/presentation/pages/login/login_page.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/presentation/pages/login/verify_mail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const rootLocation = '/Home';

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  void initState() {
    super.initState();
    _checkAndShowPopup();
  }

  Future<void> _checkAndShowPopup() async {
    final prefs = await SharedPreferences.getInstance();
    final hasShown = prefs.getBool('hasShownWelcomePopup') ?? false;

    if (!hasShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) => PopupWelcome(),
        );
      });
      prefs.setBool('hasShownWelcomePopup', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            UserHeader(),
            SizedBox(
              height: 8.h,
            ),
            StreakCard(),
            SizedBox(
              height: 16.h,
            ),
            QuickAccessRow(),
            SizedBox(
              height: 20.h,
            ),
            AiRecommendCard(),
            SizedBox(
              height: 20.h,
            ),
            SelectGroup(),
            SizedBox(
              height: 20.h,
            ),
            AchievementsSection()
          ],
        ),
      )),
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          width: 56.w,
          height: 56.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
<<<<<<< HEAD
              colors: [AppColors.royalBlue, AppColors.dodgerblue],
=======
              colors: [AppColors.royalBlue, AppColors.dodgerBlue],
>>>>>>> 3eed932 ([Task]#12 Create ui home screen)
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.athensGray1,
                blurRadius: 5.r,
                offset: Offset(2.r, 4.r),
              )
            ],
          ),
          child: Icon(Icons.add, size: 30.sp, color: AppColors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
