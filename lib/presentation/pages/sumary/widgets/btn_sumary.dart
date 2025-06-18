import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BtnSumary extends StatelessWidget {
  const BtnSumary({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.royalBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 2,
      ),
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.robot,
              color: AppColors.white,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Summarize",
              style: BrainUpTextStyles.text16Bold,
            ),
          ],
        ),
      ),
    );
  }
}
