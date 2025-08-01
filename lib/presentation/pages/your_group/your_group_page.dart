import 'package:brainup/presentation/pages/your_group/widget/provider_group_header/group_header.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/bloc/group_member_bloc.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/bloc/group_member_event.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/group_member.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/repository/member_repository.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_state/group_state.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_activity/recent_activity.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_study_material/study_material.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_study_material/subject_infor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class YourGroupPage extends StatelessWidget {
  static const rootLocation = "/YourGroupPage";

  const YourGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = GoRouterState.of(context);
    final info = state.extra as SubjectInfo; // model CHUNG: subjectId/gradeId

    final groupRepo = GroupMemberRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider<GroupMembersBloc>(
          create: (_) => GroupMembersBloc(groupRepo)
            ..add(
              LoadGroupMembers(
                subject: info.subject, // ✅ dùng đúng field
                grade: info.grade, // ✅ dùng đúng field
              ),
            ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Group'),
          centerTitle: true,
          leading: const BackButton(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nếu các widget này cần subject/grade, truyền vào:
              GroupHeader(),
              GroupStats(),

              GroupMembers(
                subjectId: info.subject, // ✅ trùng với Bloc
                gradeId: info.grade,
              ),

              RecentActivitySection(),

              // StudyMaterialsSection nên dùng model chung SubjectInfo
              StudyMaterialsSection(info: info),
              // hoặc nếu widget này nhận 2 string:
              // StudyMaterialsSection(subjectId: info.subjectId, gradeId: info.gradeId),
            ],
          ),
        ),
      ),
    );
  }
}
