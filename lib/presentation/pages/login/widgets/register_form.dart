import 'package:brainup/presentation/pages/login/widgets/register_widget.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
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
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final repasswordController = TextEditingController();
  bool isCheckedIcon = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RegisterWidget(
            label: "Full Name",
            hintText: "Enter your name",
            controller: phoneNumberController,
            isPassword: false,
            prefixIcon: FontAwesomeIcons.lock,
            validator: (value) {
              if (value == null || value.isEmpty)
                return 'Please enter your name';
            },
          ),
          SizedBox(
            height: 20,
          ),
          RegisterWidget(
            label: "Email",
            hintText: "name@gmail.com",
            controller: emailController,
            isPassword: false,
            prefixIcon: FontAwesomeIcons.lock,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Please enter email';
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          RegisterWidget(
            label: "Phone Number",
            hintText: "Enter your phone",
            controller: phoneNumberController,
            isPassword: false,
            prefixIcon: FontAwesomeIcons.lock,
            validator: (value) {
              if (value == null || value.isEmpty)
                return 'Please enter your phone number';
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          RegisterWidget(
            label: "Password",
            hintText: "Create a password",
            controller: passwordController,
            isPassword: true,
            prefixIcon: FontAwesomeIcons.lock,
            validator: (value) {
              if (value == null || value.isEmpty)
                return 'Please enter password';
              if (value.length < 6)
                return 'Password must be at least 6 characters';
              return null;
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          RegisterWidget(
            label: "Comfirm Password",
            hintText: "Create a password",
            controller: repasswordController,
            isPassword: true,
            prefixIcon: FontAwesomeIcons.lock,
            validator: (value) {
              if (value == null || value.isEmpty)
                return 'Please enter password';
              if (value.length < 6)
                return 'Password must be at least 6 characters';
              return null;
            },
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
                  color: isCheckedIcon ? AppColors.royalBlue : AppColors.black,
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "I agree to the ",
                      style: BrainUpTextStyles.text14Normal
                          .copyWith(color: AppColors.riverBed)),
                  TextSpan(
                      text: "Terms of Service ",
                      style: BrainUpTextStyles.text14Normal
                          .copyWith(color: AppColors.cornflowerBlue)),
                  TextSpan(
                      text: "and ",
                      style: BrainUpTextStyles.text14Normal
                          .copyWith(color: AppColors.riverBed)),
                  TextSpan(
                      text: "Privacy Policy",
                      style: BrainUpTextStyles.text14Normal
                          .copyWith(color: AppColors.cornflowerBlue)),
                ])),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: 294.w,
            height: 60.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                gradient: LinearGradient(
                  colors: [
                    AppColors.cornflowerBlue,
                    AppColors.cornflowerBlue1,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 3.r,
                      offset: Offset(0, 2))
                ]),
            child: Center(
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
