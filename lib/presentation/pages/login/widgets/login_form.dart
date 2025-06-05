import 'package:brainup/presentation/pages/login/widgets/login_widget.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscuretext = true;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LoginWidget(
                label: "Email",
                hintext: "your@gmail.com",
                isPassword: false,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              LoginWidget(
                label: "Password",
                hintext: "Password",
                isPassword: true,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot password?',
                      style: BrainUpTextStyles.text12Normal.copyWith(
                          color: AppColors.royalBlue,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.royalBlue,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text('Login with OTP',
                      style: BrainUpTextStyles.text12Normal.copyWith(
                          color: AppColors.paleSky,
                          fontWeight: FontWeight.w500))
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              SizedBox(
                width: 302.w,
                height: 52.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.royalBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 3,
                  ),
                  onPressed: () async {},
                  child: Text("Login", style: BrainUpTextStyles.text18Bold),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 32.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: 0.6.sp,
                    ),
                  ),
                  Text('Or login with',
                      style: BrainUpTextStyles.text12Bold.copyWith(
                          color: AppColors.grayChateau,
                          fontWeight: FontWeight.w500)),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: 0.6.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialLoginButton(
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: AppColors.cinnabar,
                      size: 20.sp,
                    ),
                    onTap: () async {},
                  ),
                  SizedBox(width: 16.w),
                  _buildSocialLoginButton(
                    icon: FaIcon(
                      FontAwesomeIcons.apple,
                      color: AppColors.ebony,
                      size: 20.sp,
                    ),
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

Widget _buildSocialLoginButton(
    {required Widget icon, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.athensGray,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.athensGray1),
      ),
      child: Center(child: icon),
    ),
  );
}
