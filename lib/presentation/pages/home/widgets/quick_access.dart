import 'package:brainup/presentation/pages/home/widgets/quick_access_item.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/extensions/context_ext.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class QuickAccessRow extends StatelessWidget {
  const QuickAccessRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: QuickAccessItem(
                icon: FontAwesomeIcons.brain,
                label: context.l10n!.aichat,
                onTap: () {}),
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            child: QuickAccessItem(
                icon: FontAwesomeIcons.cube,
                label: context.l10n!.flashcards,
                onTap: () {}),
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            child: QuickAccessItem(
                icon: FontAwesomeIcons.clipboardQuestion,
                label: context.l10n!.quizroom,
                onTap: () {}),
          ),
        ],
      ),
    );
  }
}
