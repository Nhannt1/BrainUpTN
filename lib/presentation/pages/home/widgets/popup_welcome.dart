import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/extensions/context_ext.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopupWelcome extends StatefulWidget {
  const PopupWelcome({super.key});

  @override
  State<PopupWelcome> createState() => _PopupWelcomeState();
}

class _PopupWelcomeState extends State<PopupWelcome> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 22.w,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.w),
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 40.r,
            child: ClipOval(
              child: Image.asset(
                'assets/images/img.png',
                width: 96.w,
                height: 96.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            context.l10n!.welcometobrAInUp,
            style:
                BrainUpTextStyles.text20Bold.copyWith(color: AppColors.paleSky),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          Text(
            context.l10n!.personalizeyourlearning,
            style: BrainUpTextStyles.text14Normal
                .copyWith(color: AppColors.paleSky),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.royalBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                elevation: 3.r,
              ),
              onPressed: () => Navigator.pop(context),
              child: Text(
                context.l10n!.getstarted,
                style: BrainUpTextStyles.text16Normal.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
