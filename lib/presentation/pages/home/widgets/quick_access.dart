import 'package:brainup/presentation/resources/gen/colors.gen.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: QuickAccessItem(
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
          ),
          Expanded(
            child: QuickAccessItem(
                icon: FontAwesomeIcons.clipboardQuestion,
                label: "Quiz Room",
                onTap: () {}),
          ),
        ],
      ),
    );
  }
}

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
