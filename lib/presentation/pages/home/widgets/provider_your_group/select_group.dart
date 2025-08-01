import 'package:brainup/presentation/pages/home/widgets/provider_your_group/entities/color_bg.dart';
import 'package:brainup/presentation/pages/home/widgets/provider_your_group/entities/group_card.dart';
import 'package:brainup/presentation/pages/home/widgets/provider_your_group/bloc/your_group_bloc.dart';
import 'package:brainup/presentation/pages/home/widgets/provider_your_group/bloc/your_group_state.dart';
import 'package:brainup/presentation/pages/home/widgets/provider_your_group/entities/fontawesome_Iconsmap.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_activity/bloc/group_activity_bloc.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_activity/bloc/group_activity_event.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_header/bloc/group_lesson_bloc.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_header/bloc/group_lesson_event.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/bloc/group_member_bloc.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/bloc/group_member_event.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_state/bloc/group_state_bloc.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_state/bloc/group_state_event.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_study_material/bloc/study_material_bloc.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_study_material/bloc/study_material_event.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_study_material/subject_infor.dart';
import 'package:brainup/presentation/pages/your_group/your_group_page.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/extensions/context_ext.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SelectGroup extends StatefulWidget {
  const SelectGroup({super.key});

  @override
  State<SelectGroup> createState() => _SelectGroupState();
}

class _SelectGroupState extends State<SelectGroup> {
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
        BlocBuilder<GroupBloc, GroupState>(
          builder: (context, state) {
            if (state is GroupLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is GroupError) {
              return Center(child: Text(state.message));
            }
            if (state is GroupLoaded) {
              final groups = state.groups;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    ...groups.map((group) {
                      final colors = getGroupColors(group.title);
                      final baseColor = colors.last; // màu gradient cuối
                      final darkerColor = darken(baseColor,
                          amount: 0.15, saturate: 0.1); // làm tối 15%
                      return Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: GroupCard(
                          ontap: () {
                            context.read<LessonBloc>().add(
                                  LoadLessons(
                                    grade: 'grade_6',
                                    subject: group.title,
                                    colorStart: colors.first,
                                    colorEnd:
                                        colors.last, // hoặc truyền động nếu cần
                                  ),
                                );
                            context.read<GroupStatsBloc>().add(LoadGroupStatse(
                                  subject: group.title,
                                  grade: 'grade_6',
                                ));
                            context.read<GroupMembersBloc>().add(
                                LoadGroupMembers(
                                    subject: group.title, grade: 'grade_6'));
                            context.read<RecentActivityBloc>().add(
                                LoadRecentActivities(
                                    subject: group.title, grade: 'grade_6'));
                            context
                                .read<StudyMaterialBloc>()
                                .add(LoadStudyMaterials());
                            context.push(
                              YourGroupPage.rootLocation,
                              extra: SubjectInfo(
                                  subject: group.title, grade: 'grade_6'),
                            );
                          },
                          icon: FontAwesomeIconsMap[group.icon] ??
                              FontAwesomeIcons.book,
                          title: group.title,
                          subtitle: "${group.members} members",
                          textColor: darkerColor,
                          backgroundColor: colors,
                          iconColor: darkerColor,
                        ),
                      );
                    })
                  ],
                ),
              );
            }
            return SizedBox(); // Initial or empty
          },
        )
      ],
    );
  }
}
