import 'package:brainup/data/auth/auth_login.dart';
import 'package:brainup/presentation/pages/login/verify_mail_page.dart';
import 'package:brainup/presentation/pages/login/widgets/button_widget.dart';
import 'package:brainup/presentation/pages/login/widgets/register_widget.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

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
  final AuthLogin auth = AuthLogin();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    repasswordController.dispose();
    super.dispose();
  }

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
            controller: nameController,
            isPassword: false,
            prefixIcon: FontAwesomeIcons.lock,
            validator: (value) {
              if (value == null || value.isEmpty)
                return 'Please enter your name';

              if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value.trim())) {
                return 'Incorrect format';
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          RegisterWidget(
            //   key: _formkey,
            label: "Email",
            hintText: "name@gmail.com",
            controller: emailController,
            isPassword: false,
            prefixIcon: FontAwesomeIcons.lock,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Please enter email';
              if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$')
                  .hasMatch(value.trim())) {
                return 'Incorrect format';
              }
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
              if (!RegExp(r'^0[0-9]{9}$').hasMatch(value.trim())) {
                return 'Incorrect format';
              }
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
          ButtonWidget(
            text: "Register",
            ontap: () async {
              if (_formkey.currentState!.validate()) {
                if (!isCheckedIcon) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please agree to the terms')),
                  );
                  return;
                }
                if (passwordController.text == repasswordController.text) {
                  try {
                    await auth.signUpSaveUser(
                        fullname: nameController.text,
                        email: emailController.text.trim(),
                        phoneNumber: phoneNumberController.text,
                        password: passwordController.text);
                    context.go(VerifyEmailPage.rootLocation);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registered successfully!')),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Email already in use')),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Lỗi đăng ký: $e')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Passwords do not match')),
                  );
                }
                nameController.clear();
                emailController.clear();
                phoneNumberController.clear();
                passwordController.clear();
                repasswordController.clear();
              }
            },
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
