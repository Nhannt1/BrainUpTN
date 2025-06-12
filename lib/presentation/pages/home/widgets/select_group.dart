import 'package:brainup/presentation/pages/home/widgets/group_card.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/extensions/context_ext.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectGroup extends StatelessWidget {
  const SelectGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.l10n!.yourgroups,
                  style: BrainUpTextStyles.text16Bold.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.w500)),
              Text(
                context.l10n!.viewall,
                style: BrainUpTextStyles.text12Bold.copyWith(
                  color: AppColors.cornflowerBlue,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              GroupCard(
                icon: FontAwesomeIcons.flask,
                title: context.l10n!.biology,
                textColor: AppColors.salem,
                subtitle: "12 members",
                backgroundColor: [AppColors.feta, AppColors.iceCold],
                iconColor: AppColors.salem,
              ),
              SizedBox(width: 12.w),
              GroupCard(
                icon: FontAwesomeIcons.calculator,
                title: context.l10n!.mathstudy,
                textColor: AppColors.amroonFlush,
                subtitle: "8 members",
                backgroundColor: [
                  AppColors.carouselPink,
                  AppColors.classicRose
                ],
                iconColor: AppColors.amroonFlush,
              ),
              SizedBox(width: 12.w),
              GroupCard(
                icon: FontAwesomeIcons.book,
                title: context.l10n!.literature,
                textColor: AppColors.richGold,
                subtitle: "5 members",
                backgroundColor: [AppColors.orangeWhite, AppColors.dolly],
                iconColor: AppColors.richGold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
