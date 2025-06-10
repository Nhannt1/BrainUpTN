import 'package:brainup/data/auth/auth_login.dart';
import 'package:brainup/data/repository/source/local/preference/share_pref_login.dart';
import 'package:brainup/presentation/pages/home/home_page.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BottomRegister extends StatefulWidget {
  const BottomRegister({super.key});

  @override
  State<BottomRegister> createState() => _BottomRegisterState();
}

class _BottomRegisterState extends State<BottomRegister> {
  final AuthLogin auth = AuthLogin();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(color: Colors.grey.shade400, thickness: 0.6.sp),
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
                onTap: () async {
                  final result = await auth.signInwithGoogle();
                  if (result == null) {
                    await SharePrefLogin.instance.saveLogin();
                    context.go(Home.rootLocation);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('✅ Đăng nhập Google thành công!'),
                    ));
                  } else {
                    print(result);
                  }
                },
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
      height: 58.h,
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
