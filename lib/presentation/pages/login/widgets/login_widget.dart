import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginWidget extends StatefulWidget {
  final String label;
  final String hintext;
  final bool isPassword;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  const LoginWidget(
      {super.key,
      required this.label,
      required this.hintext,
      required this.isPassword,
      required this.controller,
      this.prefixIcon,
      this.validator});

  @override
  State<LoginWidget> createState() => _LoginWidget();
}

class _LoginWidget extends State<LoginWidget> {
  bool _obscuretext = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(widget.label,
            style: BrainUpTextStyles.text14Normal.copyWith(
                color: AppColors.oxfordBlue, fontWeight: FontWeight.w500)),
        SizedBox(
          height: 12.h,
        ),
        SizedBox(
          height: 50.h,
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _obscuretext : false,
            style: TextStyle(
              fontSize: 16.sp,
            ),
            decoration: InputDecoration(
                fillColor: AppColors.athensGray,
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide:
                      BorderSide(color: AppColors.athensGray1, width: 0.5.w),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide:
                      BorderSide(color: AppColors.athensGray1, width: 0.5.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                suffixIcon: widget.isPassword
                    ? GestureDetector(
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
                      )
                    : null,
                labelStyle: TextStyle(color: AppColors.spunPearl),
                hintText: widget.hintext,
                hintStyle: BrainUpTextStyles.text16Normal.copyWith(
                  color: AppColors.spunPearl,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w)),
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
    );
  }
}
