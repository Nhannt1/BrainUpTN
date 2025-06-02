import 'package:brainup/presentation/resources/gen/colors.gen.dart';
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
                    style: TextStyle(color: Color(0xFF374151), fontSize: 14),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    child: TextFormField(
                      controller: email,
                      style: TextStyle(fontSize: 16.sp),
                      decoration: InputDecoration(
                          fillColor: AppColors.textField,
                          filled: true,
                          hintText: 'your@email.com',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                                color: AppColors.strokeField, width: 0.5.w),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5.w),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.2.w),
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
                  Text(
                    "Password",
                    style: TextStyle(color: Color(0xFF374151), fontSize: 14.sp),
                  ),
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
                          fillColor: AppColors.textField,
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(
                                color: AppColors.strokeField,
                                width: 0.5.w), // khi đang focus vẫn không đỏ
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5.w),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.2.w),
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
                              color: Color(0xFF9CA3AF),
                              size: 20, // bạn có thể chỉnh size icon nhỏ lại
                            ),
                          ),
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.w)),
                      validator: (value) {
                        // Kiểm tra trống
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter password';
                        }
                        // Kiểm tra độ dài mật khẩu tối thiểu 6 ký tự
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null; // hợp lệ
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
                    child: Text('Forgot password?',
                        style: TextStyle(
                            color: Color(0xFF3870EF),
                            fontSize: 12.sp,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF3870EF),
                            fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    'Login with OTP',
                    style: TextStyle(
                        color: Color(0xFF374151),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  )
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
                    backgroundColor: AppColors.btnLogin,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 3,
                  ),
                  onPressed: () async {
                    // final bool check = await LoginUser(
                    //   email: email.text,
                    //   password: password.text,
                    // ); // đăng kí vào firebasestore

                    // if (_formkey.currentState!.validate()) {
                    //   bool success = (await authLogin.signInWithEmail(
                    //     email.text,
                    //     password.text,
                    //   ));
                    //   if (success) {
                    //     // await prefs.Login(); // Lưu trạng thái đăng nhập
                    //     if (!mounted) return;
                    //     // await prefs.Login();
                    //     // context.go(HomeBrainUpScreen
                    //     //     .rootLocation); // Chuyển đến trang home
                    //   } else {
                    //     if (!mounted) return;
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(
                    //         content: Text("Email hoặc mật khẩu sai"),
                    //       ),
                    //     );
                    //   }
                    // }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                      color: Colors.grey.shade400, // màu gạch mờ
                      thickness: 0.6.sp, // độ dày
                    ),
                  ),
                  Text(
                    'Or login with',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600, // màu chữ mờ
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400, // màu gạch mờ
                      thickness: 0.6.sp, // độ dày
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
                      color: AppColors.icGoogle,
                      size: 20.sp,
                    ),
                    onTap: () async {
                      // final result = await authLogin.signInWithGoogle();
                      // if (result == null) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(content: Text("dang nhao thanh cong")));
                      //   if (!context.mounted) return;
                      //   context.go(HomeBrainUpScreen.rootLocation);
                      // } else {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(content: Text("dang nhap that bai")));
                      // }
                    },
                  ),
                  SizedBox(width: 16.w),
                  _buildSocialLoginButton(
                    icon: FaIcon(
                      FontAwesomeIcons.apple,
                      color: AppColors.icApple,
                      size: 20.sp,
                    ),
                    onTap: () {
                      // Đăng nhập Apple
                    },
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
      height: 48.w,
      decoration: BoxDecoration(
        color: AppColors.textField,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(child: icon),
    ),
  );
}
