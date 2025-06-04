import 'package:brainup/presentation/pages/login/widgets/login_form.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/presentation/resources/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.royalBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Container(
            width: 350,
            height: 536,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.wildSand,
              borderRadius: BorderRadius.circular(16),
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
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 28.h),
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 28.h, left: 24.w, right: 24.w),
                      child: LoginForm(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

Widget _buildTagButton(String text, bool isSelected, onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.hawkesBlue : AppColors.wildSand,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? AppColors.royalBlue : AppColors.riverBed,
          ),
        )),
  );
}
