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
              Text("Full Name",
                  style: BrainUpTextStyles.text14Bold
                      .copyWith(color: AppColors.oxfordBlue)),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 58,
                child: TextFormField(
                  controller: name,
                  style: TextStyle(fontSize: 11.sp),
                  decoration: InputDecoration(
                    fillColor: AppColors.athensGray,
                    filled: true,
                    hintText: 'Enter your name',
                    hintStyle: BrainUpTextStyles.text16Normal
                        .copyWith(color: AppColors.spunPearl),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                          color: AppColors.athensGray1, width: 0.5.w),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                          color: AppColors.athensGray1, width: 0.5.w),
                    ),
                    prefixIcon: Icon(Icons.person,
                        size: 20.w, color: AppColors.spunPearl),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                          color: AppColors.athensGray1, width: 0.5.w),
                    ),
                  ),
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
                style: BrainUpTextStyles.text14Bold
                    .copyWith(color: AppColors.oxfordBlue),
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 58.h,
                child: TextFormField(
                  controller: email,
                  style: TextStyle(fontSize: 16.sp),
                  decoration: InputDecoration(
                      fillColor: AppColors.athensGray,
                      filled: true,
                      prefixIcon: Icon(Icons.email,
                          size: 20.sp, color: AppColors.spunPearl),
                      hintText: 'name@gmail.com',
                      hintStyle: BrainUpTextStyles.text16Normal
                          .copyWith(color: AppColors.spunPearl),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                            color: AppColors.athensGray1, width: 0.5.w),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                            color: AppColors.athensGray1, width: 0.5.w),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                            color: AppColors.athensGray1, width: 0.5.w),
                      )),
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
                style: BrainUpTextStyles.text14Bold
                    .copyWith(color: AppColors.oxfordBlue),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                controller: phone,
                style: TextStyle(fontSize: 16.sp),
                decoration: InputDecoration(
                    fillColor: AppColors.athensGray,
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(14),
                      child: FaIcon(FontAwesomeIcons.phone,
                          size: 17.sp, color: AppColors.spunPearl),
                    ),
                    hintText: 'Enter your phone',
                    hintStyle: BrainUpTextStyles.text16Normal
                        .copyWith(color: AppColors.spunPearl),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: AppColors.athensGray1),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                            color: AppColors.athensGray1, width: 0.5.w)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                          color: AppColors.athensGray1, width: 0.5.w),
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
            height: 20.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Password",
                style: BrainUpTextStyles.text14Bold
                    .copyWith(color: AppColors.oxfordBlue),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                controller: password,
                obscureText: _obscuretext,
                style: TextStyle(fontSize: 16.sp),
                decoration: InputDecoration(
                  fillColor: AppColors.athensGray,
                  filled: true,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: AppColors.athensGray1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: AppColors.athensGray1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: AppColors.athensGray1)),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: FaIcon(FontAwesomeIcons.lock,
                        size: 17.sp, color: AppColors.spunPearl),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscuretext = !_obscuretext;
                      });
                    },
                    child: Icon(
                      _obscuretext ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.spunPearl,
                      size: 20.sp,
                    ),
                  ),
                  labelStyle: TextStyle(color: AppColors.spunPearl),
                  hintText: 'Create a password',
                  hintStyle: BrainUpTextStyles.text16Normal
                      .copyWith(color: AppColors.spunPearl),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                ),
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
                style: BrainUpTextStyles.text14Bold
                    .copyWith(color: AppColors.oxfordBlue),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                controller: repassword,
                obscureText: _CfObscuretext,
                style: TextStyle(fontSize: 16.sp),
                decoration: InputDecoration(
                  fillColor: AppColors.athensGray,
                  filled: true,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(color: AppColors.athensGray1),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: AppColors.athensGray1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: AppColors.athensGray1)),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: FaIcon(FontAwesomeIcons.lock,
                        size: 17.sp, color: AppColors.spunPearl),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _CfObscuretext = !_CfObscuretext;
                      });
                    },
                    child: Icon(
                      _CfObscuretext ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.spunPearl,
                      size: 20.sp,
                    ),
                  ),
                  labelStyle: TextStyle(color: AppColors.spunPearl),
                  hintText: 'Create a password',
                  hintStyle: BrainUpTextStyles.text16Normal
                      .copyWith(color: AppColors.spunPearl),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                ),
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
