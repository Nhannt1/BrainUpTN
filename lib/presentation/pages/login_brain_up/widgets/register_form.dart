import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  bool _obscuretext = true;
  bool _CfObscuretext = true;
  final _formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final repassword = TextEditingController();
  bool isCheckedIcon = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Full Name",
                style: TextStyle(color: Color(0xFF374151), fontSize: 14.sp),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 58,
                child: TextFormField(
                  controller: name,
                  style: TextStyle(fontSize: 11),

                  decoration: InputDecoration(
                    fillColor: AppColors.textField,
                    filled: true,
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                          color: AppColors.strokeField, width: 0.5.w),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                          color: AppColors.strokeField, width: 0.5.w),
                    ),
                    prefixIcon: Icon(Icons.person,
                        size: 20.w, color: Color(0xFF9CA3AF)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          color: AppColors.strokeField, width: 0.5.w),
                    ),
                  ),
                  // kiểm tra dữ liệu nhập
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
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email",
                style: TextStyle(color: Color(0xFF374151), fontSize: 14),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 58,
                child: TextFormField(
                  controller: email,
                  style: TextStyle(fontSize: 16),

                  decoration: InputDecoration(
                      fillColor: AppColors.textField,
                      filled: true,
                      prefixIcon:
                          Icon(Icons.email, size: 20, color: Color(0xFF9CA3AF)),
                      hintText: 'name@gmail.com',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: AppColors.strokeField, width: 0.5.w),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                            color: AppColors.strokeField, width: 0.5.w),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                            color: AppColors.strokeField, width: 0.5.w),
                      )),
                  // kiểm tra dữ liệu nhập
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
          SizedBox(
            height: 20.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Phone Number",
                style: TextStyle(color: Color(0xFF374151), fontSize: 14.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                controller: phone,
                style: TextStyle(fontSize: 16.sp),
                decoration: InputDecoration(
                    fillColor: AppColors.textField,
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(14),
                      child: FaIcon(FontAwesomeIcons.phone,
                          size: 17.sp, color: Color(0xFF9CA3AF)),
                    ),
                    hintText: 'Enter your phone',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: AppColors.strokeField),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                            color: AppColors.strokeField, width: 0.5.w)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                          color: AppColors.strokeField, width: 0.5.w),
                    )),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter phone';
                  }
                  return null;
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Password",
                style: TextStyle(color: Color(0xFF374151), fontSize: 14),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: password,
                obscureText: _obscuretext,
                style: TextStyle(fontSize: 16.sp),
                decoration: InputDecoration(
                  fillColor: AppColors.textField,
                  filled: true,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: AppColors.strokeField,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: AppColors.strokeField,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: AppColors.strokeField)),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: FaIcon(FontAwesomeIcons.lock,
                        size: 17, color: Color(0xFF9CA3AF)),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscuretext = !_obscuretext;
                      });
                    },
                    child: Icon(
                      _obscuretext ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xFF9CA3AF),
                      size: 20,
                      // bạn có thể chỉnh size icon nhỏ lại
                    ),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: 'Create a password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
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
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Confirm Password",
                style: TextStyle(color: Color(0xFF374151)),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                controller: repassword,
                obscureText: _CfObscuretext,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  fillColor: AppColors.textField,
                  filled: true,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: AppColors.strokeField,
                    ),
                    //borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: AppColors.strokeField)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: AppColors.strokeField)),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: FaIcon(FontAwesomeIcons.lock,
                        size: 17, color: Color(0xFF9CA3AF)),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _CfObscuretext = !_CfObscuretext;
                      });
                    },
                    child: Icon(
                      _CfObscuretext ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xFF9CA3AF),
                      size: 20, // bạn có thể chỉnh size icon nhỏ lại
                    ),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: 'Create a password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                validator: (value) {
                  // Kiểm tra trống
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter password';
                  }

                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isCheckedIcon = !isCheckedIcon;
                  });
                },
                child: Icon(
                  isCheckedIcon
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: isCheckedIcon ? Colors.blue : Colors.grey,
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                // child: Text(
                //     "I agree to the Terms of Service, and Privacy Policy")
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "I agree to the ",
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "Terms of Service ",
                      style: TextStyle(color: Color(0xFF6366F1))),
                  TextSpan(
                      text: "and, ", style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(color: Color(0xFF6366F1))),
                ])),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: 294,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF6366F1),
                    Color(0xFF8B5CF6),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 3,
                      offset: Offset(0, 2))
                ]),
            child: Center(
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey.shade400, // màu gạch mờ
                  thickness: 0.6, // độ dày
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSocialLoginButton(
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: AppColors.icGoogle,
                    size: 16,
                  ),
                  text: " Google",
                  onTap: () {
                    // Đăng nhập Google
                  },
                ),
                const SizedBox(width: 16),
                _buildSocialLoginButton(
                  icon: FaIcon(
                    FontAwesomeIcons.apple,
                    color: AppColors.icApple,
                    size: 17,
                  ),
                  text: "  Apple",
                  onTap: () {
                    // Đăng nhập Apple
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                    style: TextStyle(color: Colors.grey.shade700)),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Sign In",
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
          )
        ],
      ),
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
      width: 125,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.strokeField),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Center(
          child: Center(
            child: Row(
              children: [
                icon,
                SizedBox(
                  width: 2,
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
