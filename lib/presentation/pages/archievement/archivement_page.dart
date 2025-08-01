import 'package:brainup/presentation/pages/archievement/widget/provider_earned_badges/bloc/earned_badges_bloc.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_earned_badges/bloc/earned_badges_event.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_earned_badges/earned_badges_grid.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_header/bloc/header_arch_bloc.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_header/bloc/header_arch_event.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_header/header_section.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_header/repository/repository_achivement.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_progress/Learning_progress_card.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_progress/bloc/progess_bloc.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_progress/bloc/progress_event.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_recent_achievements/bloc/recent_achievements_bloc.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_recent_achievements/bloc/recent_achievements_event.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_recent_achievements/recent_achievements_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AchievementsPage extends StatelessWidget {
  static const rootLocation = "/AchievementsPage";

  AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return const Scaffold(
        body: Center(child: Text("User not logged in")),
      );
    }
    final uid = currentUser.uid;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => HeaderArchBloc(RepositoryAchivement())
              ..add(LoadUserData(uid: uid))),
        BlocProvider(create: (_) => ProgressBloc()..add(LoadProgress())),
        BlocProvider(
            create: (_) =>
                RecentAchievementsBloc()..add(LoadRecentAchievements())),
        BlocProvider(create: (_) => EarnedBadgesBloc()..add(LoadBadges())),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Achievements"),
          centerTitle: true,
          leading: BackButton(),
          //   backgroundColor: Colors.deepPurple,
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderSection(),
              SizedBox(height: 16),
              LearningProgressCard(),
              SizedBox(height: 16),
              RecentAchievementsList(),
              SizedBox(height: 16),
              EarnedBadgesGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
