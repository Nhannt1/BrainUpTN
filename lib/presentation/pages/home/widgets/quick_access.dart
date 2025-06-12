<<<<<<< HEAD
import 'package:brainup/presentation/pages/home/widgets/quick_access_item.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/extensions/context_ext.dart';
=======
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
>>>>>>> 3eed932 ([Task]#12 Create ui home screen)
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
<<<<<<< HEAD
      padding: EdgeInsets.symmetric(horizontal: 16.w),
=======
      padding: const EdgeInsets.symmetric(horizontal: 16),
>>>>>>> 3eed932 ([Task]#12 Create ui home screen)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: QuickAccessItem(
<<<<<<< HEAD
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
=======
                icon: FontAwesomeIcons.brain, label: "AI Chat", onTap: () {}),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: QuickAccessItem(
                icon: FontAwesomeIcons.cube, label: "Flashcards", onTap: () {}),
          ),
          SizedBox(
            width: 12,
>>>>>>> 3eed932 ([Task]#12 Create ui home screen)
          ),
          Expanded(
            child: QuickAccessItem(
                icon: FontAwesomeIcons.clipboardQuestion,
<<<<<<< HEAD
                label: context.l10n!.quizroom,
=======
                label: "Quiz Room",
>>>>>>> 3eed932 ([Task]#12 Create ui home screen)
                onTap: () {}),
          ),
        ],
      ),
    );
  }
}
<<<<<<< HEAD
=======

class QuickAccessItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const QuickAccessItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.athensGray1,
              blurRadius: 1.r,
              offset: Offset(1.r, 2.r),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 19.w),
          child: Column(
            children: [
              FaIcon(icon, color: AppColors.cornflowerBlue, size: 24.sp),
              SizedBox(height: 4.h),
              Text(label,
                  style: BrainUpTextStyles.text12Normal.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
>>>>>>> 3eed932 ([Task]#12 Create ui home screen)
