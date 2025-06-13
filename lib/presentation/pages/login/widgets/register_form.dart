import 'package:brainup/data/auth/auth_login.dart';
import 'package:brainup/presentation/pages/login/verify_mail_page.dart';
import 'package:brainup/presentation/pages/login/widgets/button_widget.dart';
import 'package:brainup/presentation/pages/login/widgets/register_widget.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/extensions/context_ext.dart';
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
  final ageController = TextEditingController();
  final repasswordController = TextEditingController();
  bool isCheckedIcon = false;
  final AuthLogin auth = AuthLogin();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    ageController.dispose();
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
            hintText: context.l10n!.enteryourname,
            controller: nameController,
            isPassword: false,
            prefixIcon: FontAwesomeIcons.lock,
            validator: (value) {
              if (value == null || value.isEmpty)
                return context.l10n!.pleaseenteryourname;

              if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value.trim())) {
                return context.l10n!.incorrectformat;
              }
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          RegisterWidget(
            label: "Email",
            hintText: "name@gmail.com",
            controller: emailController,
            isPassword: false,
            prefixIcon: FontAwesomeIcons.lock,
            validator: (value) {
              if (value == null || value.isEmpty)
                return context.l10n!.pleaseenteremail;
              if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$')
                  .hasMatch(value.trim())) {
                return context.l10n!.incorrectformat;
              }
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          RegisterWidget(
            label: context.l10n!.phonenumber,
            hintText: context.l10n!.enteryourphone,
            controller: phoneNumberController,
            isPassword: false,
            prefixIcon: FontAwesomeIcons.lock,
            validator: (value) {
              if (value == null || value.isEmpty)
                return context.l10n!.pleaseenteryourphonenumber;
              if (!RegExp(r'^0[0-9]{9}$').hasMatch(value.trim())) {
                return context.l10n!.incorrectformat;
              }
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          RegisterWidget(
            label: context.l10n!.age,
            hintText: context.l10n!.enteryourage,
            controller: ageController,
            isPassword: false,
            prefixIcon: FontAwesomeIcons.lock,
            validator: (value) {
              if (value == null || value.isEmpty)
                return context.l10n!.enteryourage;
              if (!RegExp(r'^\d{2}$').hasMatch(value.trim())) {
                return context.l10n!.incorrectformat;
              }
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          RegisterWidget(
            label: context.l10n!.password,
            hintText: context.l10n!.createapassword,
            controller: passwordController,
            isPassword: true,
            prefixIcon: FontAwesomeIcons.lock,
            validator: (value) {
              if (value == null || value.isEmpty)
                return context.l10n!.pleaseenterpassword;
              if (value.length < 6)
                return context.l10n!.passwordmustbeatleast6characters;
              return null;
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          RegisterWidget(
            label: context.l10n!.comfirmpassword,
            hintText: context.l10n!.createapassword,
            controller: repasswordController,
            isPassword: true,
            prefixIcon: FontAwesomeIcons.lock,
            validator: (value) {
              if (value == null || value.isEmpty)
                return context.l10n!.pleaseenterpassword;
              if (value.length < 6)
                return context.l10n!.passwordmustbeatleast6characters;
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
                      text: context.l10n!.iagreetothe,
                      style: BrainUpTextStyles.text14Normal
                          .copyWith(color: AppColors.riverBed)),
                  TextSpan(
                      text: context.l10n!.termsofservice,
                      style: BrainUpTextStyles.text14Normal
                          .copyWith(color: AppColors.cornflowerBlue)),
                  TextSpan(
                      text: context.l10n!.and,
                      style: BrainUpTextStyles.text14Normal
                          .copyWith(color: AppColors.riverBed)),
                  TextSpan(
                      text: context.l10n!.privacypolicy,
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
            text: context.l10n!.register,
            ontap: () async {
              if (_formkey.currentState!.validate()) {
                if (!isCheckedIcon) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(context.l10n!.pleaseagreetotheterms)),
                  );
                  return;
                }
                if (passwordController.text == repasswordController.text) {
                  try {
                    await auth.signUpSaveUser(
                        fullname: nameController.text,
                        email: emailController.text.trim(),
                        phoneNumber: phoneNumberController.text.trim(),
                        age: ageController.text.trim(),
                        password: passwordController.text.trim());
                    context.go(VerifyEmailPage.rootLocation);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(context.l10n!.registeredsuccessfully)),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(context.l10n!.emailalreadyinuse)),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registration error: $e')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(context.l10n!.passwordsdonotmatch)),
                  );
                }
                nameController.clear();
                emailController.clear();
                phoneNumberController.clear();
                passwordController.clear();
                repasswordController.clear();
                ageController.clear();
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
