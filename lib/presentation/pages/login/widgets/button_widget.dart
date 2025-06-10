import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const ButtonWidget({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 302.w,
      height: 52.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.royalBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 3.r,
        ),
        onPressed: ontap,
        child: Text(text, style: BrainUpTextStyles.text18Bold),
      ),
    );
  }
}
