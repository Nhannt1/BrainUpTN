import 'package:brainup/data/auth/auth_login.dart';
import 'package:brainup/data/repository/source/local/user_local_data_source.dart';
import 'package:brainup/di/di.dart';
import 'package:brainup/presentation/pages/home/home_page.dart';
import 'package:brainup/presentation/pages/login/widgets/button_widget.dart';
import 'package:brainup/presentation/pages/login/widgets/login_widget.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthLogin auth = AuthLogin();
  final UserLocalDataSource userLocal = getIt<UserLocalDataSource>();
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
                    return 'Please enter your email';
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
              ButtonWidget(
                text: "Login",
                ontap: () async {
                  if (_formkey.currentState!.validate()) {
                    SignInStatus result = await auth.signInWithEmail(
                        emailController.text.trim(),
                        passwordController.text.trim());

                    if (!mounted) return;
                    switch (result) {
                      case SignInStatus.success:
                        await userLocal.saveHasLogin(hasLogin: true);
                        context.go(Home.rootLocation);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login successful!")),
                        );
                        emailController.clear();
                        passwordController.clear();
                        break;

                      case SignInStatus.emailNotVerified:
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  "⚠️ Please verify your email before logging in.")),
                        );
                        break;

                      case SignInStatus.wrongCredentials:
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("❌ Incorrect email or password.")),
                        );
                        break;
                    }
                  }
                },
              )
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
                    onTap: () async {
                      final result = await auth.signInwithGoogle();
                      if (result == null) {
                        await userLocal.saveHasLogin(hasLogin: true);
                        context.go(Home.rootLocation);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Google login successful!'),
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
