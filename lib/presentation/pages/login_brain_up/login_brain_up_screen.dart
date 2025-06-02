import 'package:brainup/presentation/pages/login_brain_up/widgets/login_form.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/presentation/resources/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBrainUpScreen extends StatefulWidget {
  const LoginBrainUpScreen({super.key});
  static const rootLocation = '/LoginBrainUpScreen';

  @override
  State<LoginBrainUpScreen> createState() => _LoginBrainUpScreenState();
}

class _LoginBrainUpScreenState extends State<LoginBrainUpScreen> {
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
                  color: Color(0xFF3870EF),
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
              color: AppColors.ctLogin,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                //  Đổ bóng
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
          color: isSelected ? Color(0xFFEAF1FE) : AppColors.ctLogin,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Color(0xFF3870EF) : Color(0xFF4B5563),
          ),
        )),
  );
}
