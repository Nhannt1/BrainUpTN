import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnswerButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.scandal,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: AppColors.shamrocknk, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(FontAwesomeIcons.faceSmile, color: AppColors.shamrocknk),
                  SizedBox(width: 5),
                  Text(
                    'Know',
                    style: BrainUpTextStyles.text12Normal
                        .copyWith(color: AppColors.shamrocknk),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.wispPink,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: AppColors.persianPink, width: 2),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(FontAwesomeIcons.faceFrown, color: Colors.pink),
                  SizedBox(width: 5),
                  Text(
                    "Don't Know",
                    style: BrainUpTextStyles.text12Normal
                        .copyWith(color: AppColors.amroonFlush),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
