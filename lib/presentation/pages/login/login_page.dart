import 'package:brainup/presentation/pages/login/widgets/login_form.dart';
import 'package:brainup/presentation/pages/login/widgets/register_form.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/presentation/resources/gen/fonts.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const rootLocation = '/LoginPage';

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Material(
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          child: SafeArea(
            child: Center(
              child: Text(
                'BrAInUp',
                style: BrainUpTextStyles.text20Bold.copyWith(
                  color: AppColors.royalBlue,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColors.wildSand,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: Offset(1.h, 4.h),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 24.w, right: 24.w, top: 28.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20.w,
                        children: [
                          _buildTagButton("Login", isLogin, () {
                            setState(() => isLogin = true);
                          }),
                          _buildTagButton("Register", !isLogin, () {
                            setState(() => isLogin = false);
                          })
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 28.h, left: 24.w, right: 24.w),
                      child: isLogin ? LoginForm() : RegisterForm(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              if (!isLogin)
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                              color: Colors.grey.shade400, thickness: 0.6.sp),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildSocialLoginButton(
                            icon: FaIcon(
                              FontAwesomeIcons.google,
                              color: AppColors.cinnabar,
                              size: 17.sp,
                            ),
                            text: "Google",
                            onTap: () {},
                          ),
                          SizedBox(width: 16.w),
                          _buildSocialLoginButton(
                            icon: FaIcon(
                              FontAwesomeIcons.apple,
                              color: AppColors.ebony,
                              size: 17.sp,
                            ),
                            text: "Apple",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 32.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?",
                              style: TextStyle(color: AppColors.riverBed)),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            "Sign In",
                            style: TextStyle(color: AppColors.cornflowerBlue),
                          )
                        ],
                      ),
                    )
                  ],
                )
            ],
          ),
        ),
      )),
    );
  }
}

Widget _buildSocialLoginButton({
  required Widget icon,
  required String text,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.athensGray1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 45.w,
        ),
        child: Center(
          child: Center(
            child: Row(
              children: [
                icon,
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildTagButton(String text, bool isSelected, onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.hawkesBlue : AppColors.wildSand,
          borderRadius: BorderRadius.circular(7.r),
        ),
        child: Text(text,
            style: BrainUpTextStyles.text16Bold.copyWith(
                color: isSelected ? AppColors.royalBlue : AppColors.riverBed))),
  );
}
