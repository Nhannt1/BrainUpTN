import 'package:brainup/presentation/pages/home/home_page.dart';
import 'package:brainup/presentation/pages/profile/widgets/action_buttton.dart';
import 'package:brainup/presentation/pages/profile/widgets/form.dart';
import 'package:brainup/presentation/pages/profile/widgets/learning_goal.dart';
import 'package:brainup/presentation/pages/profile/widgets/avatar.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static const rootLocation = "/ProfileScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLilac,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        leading: InkWell(
            onTap: () {
              context.go(Home.rootLocation);
            },
            child: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text(
          "Profile",
          style: BrainUpTextStyles.text18Bold.copyWith(
              color: AppColors.cloudBurstl, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Avatar(),
            FormProfile(),
            LearningGoals(),
            ActionButtons(),
          ],
        ),
      )),
    );
  }
}
