import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterWidget extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  const RegisterWidget(
      {super.key,
      required this.label,
      required this.hintText,
      required this.isPassword,
      required this.controller,
      this.prefixIcon,
      this.validator});

  @override
  State<RegisterWidget> createState() => _RegisterWidget();
}

class _RegisterWidget extends State<RegisterWidget> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: BrainUpTextStyles.text14Bold
              .copyWith(color: AppColors.oxfordBlue),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscureText : false,
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
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.spunPearl,
                      size: 20.sp,
                    ),
                  )
                : null,
            labelStyle: TextStyle(color: AppColors.spunPearl),
            hintText: widget.hintText,
            hintStyle: BrainUpTextStyles.text16Normal
                .copyWith(color: AppColors.spunPearl),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
