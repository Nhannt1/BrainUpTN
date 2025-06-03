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
  final email = TextEditingController();
  final password = TextEditingController();

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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: BrainUpTextStyles.text14Normal.copyWith(
                        color: AppColors.oxfordBlue,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    child: TextFormField(
                      controller: email,
                      style: BrainUpTextStyles.text16Normal,
                      decoration: InputDecoration(
                          fillColor: AppColors.athensGray,
                          filled: true,
                          hintText: 'your@email.com',
                          hintStyle: BrainUpTextStyles.text16Normal.copyWith(
                            color: AppColors.spunPearl,
                          ),
                          labelStyle: TextStyle(
                            color: AppColors.spunPearl,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                                color: AppColors.athensGray1, width: 0.5.w),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                                color: AppColors.athensGray1, width: 0.5.w),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.w)),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Password",
                      style: BrainUpTextStyles.text14Normal.copyWith(
                          color: AppColors.oxfordBlue,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 12.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    child: TextFormField(
                      controller: password,
                      obscureText: _obscuretext,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                      decoration: InputDecoration(
                          fillColor: AppColors.athensGray,
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(
                                color: AppColors.athensGray1, width: 0.5.w),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                                color: AppColors.athensGray1, width: 0.5.w),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscuretext = !_obscuretext;
                              });
                            },
                            child: Icon(
                              _obscuretext
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.spunPearl,
                              size: 20.sp,
                            ),
                          ),
                          labelStyle: TextStyle(color: AppColors.spunPearl),
                          hintText: 'Password',
                          hintStyle: BrainUpTextStyles.text16Normal.copyWith(
                            color: AppColors.spunPearl,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.w)),
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
                  ),
                ],
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
                      style:
                          // TextStyle(
                          //     color: AppColors.paleSky,
                          //     fontSize: 12.sp,
                          //     fontWeight: FontWeight.w500),
                          BrainUpTextStyles.text12Normal.copyWith(
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
