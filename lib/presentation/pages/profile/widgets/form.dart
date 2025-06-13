import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
            style: BrainUpTextStyles.text12Bold.copyWith(
              color: AppColors.stormGray,
            ),
          ),
          _buildTextField("Name", ""),
          Text(
            "Age",
            style: BrainUpTextStyles.text12Bold.copyWith(
              color: AppColors.stormGray,
            ),
          ),
          _buildTextField("Age", ""),
          Text(
            "Email",
            style: BrainUpTextStyles.text12Bold.copyWith(
              color: AppColors.stormGray,
            ),
          ),
          _buildTextField("Email", ""),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: label,
            hintStyle: BrainUpTextStyles.text16Normal
                .copyWith(color: AppColors.spunPearl),
            filled: true,
            fillColor: AppColors.white,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.athensGray1,
                width: 1.2.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.athensGray1,
                width: 1.2.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.athensGray1,
                width: 1.5.w,
              ),
            ),
          ),
          controller: TextEditingController(
            text: initialValue,
          ),
        ),
      ),
    );
  }
}
