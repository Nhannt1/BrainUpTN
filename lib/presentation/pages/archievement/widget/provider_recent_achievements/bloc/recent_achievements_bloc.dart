import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/achievement_model.dart';
import 'recent_achievements_event.dart';
import 'recent_achievements_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecentAchievementsBloc
    extends Bloc<RecentAchievementsEvent, RecentAchievementsState> {
  RecentAchievementsBloc() : super(AchievementsInitial()) {
    on<LoadRecentAchievements>(_onLoadAchievements);
  }

  void _onLoadAchievements(LoadRecentAchievements event,
      Emitter<RecentAchievementsState> emit) async {
    emit(AchievementsLoading());
    await Future.delayed(Duration(milliseconds: 500)); // giả lập API

    try {
      final data = [
        AchievementModel(
          title: "Course Master",
          description: "Completed 5 courses in JavaScript",
          timeAgo: "2 days ago",
          points: 150,
          icon: FontAwesomeIcons.trophy,
          backgroundColor: Colors.amber.shade100,
        ),
        AchievementModel(
          title: "Quick Learner",
          description: "Finished React basics in record time",
          timeAgo: "1 week ago",
          points: 100,
          icon: FontAwesomeIcons.bolt,
          backgroundColor: Colors.purple.shade100,
        ),
        AchievementModel(
          title: "Perfect Score",
          description: "Scored 100% on Python quiz",
          timeAgo: "2 weeks ago",
          points: 75,
          icon: FontAwesomeIcons.star,
          backgroundColor: Colors.green.shade100,
        ),
      ];

      emit(AchievementsLoaded(data));
    } catch (e) {
      emit(AchievementsError("Unable to load achievements"));
    }
  }
}
