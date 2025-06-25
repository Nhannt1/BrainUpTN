import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputSectionWidget extends StatelessWidget {
  final TextEditingController controller;

  const InputSectionWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 2,
                offset: Offset(0, 1))
          ]),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.fileLines,
                  color: AppColors.cornflowerBlue,
                  size: 15.sp,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Paste text or upload a document',
                  style: BrainUpTextStyles.text14Normal
                      .copyWith(color: AppColors.oxfordBlue),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Paste your learning material here...',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.arrowUpFromBracket,
                  size: 15.sp,
                  color: AppColors.royalBlue,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Upload DOC/TXT',
                  style: BrainUpTextStyles.text12Normal
                      .copyWith(color: AppColors.royalBlue),
                ),
                Spacer(),
                Text(
                  '0/5000',
                  style: BrainUpTextStyles.text12Normal
                      .copyWith(color: AppColors.grayChateau),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
