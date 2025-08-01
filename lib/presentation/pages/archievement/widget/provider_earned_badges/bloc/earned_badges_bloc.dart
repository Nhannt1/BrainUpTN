import 'package:flutter_bloc/flutter_bloc.dart';
import 'earned_badges_event.dart';
import 'earned_badges_state.dart';
import '../model/badge_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EarnedBadgesBloc extends Bloc<EarnedBadgesEvent, EarnedBadgesState> {
  EarnedBadgesBloc() : super(BadgesInitial()) {
    on<LoadBadges>(_onLoadBadges);
  }

  void _onLoadBadges(LoadBadges event, Emitter<EarnedBadgesState> emit) async {
    emit(BadgesLoading());

    await Future.delayed(Duration(milliseconds: 500)); // giả lập API

    final data = [
      BadgeModel(
        title: "First Course",
        icon: FontAwesomeIcons.crown,
        gradientColors: [Colors.orange, Colors.redAccent],
      ),
      BadgeModel(
        title: "7 Day Streak",
        icon: FontAwesomeIcons.fire,
        gradientColors: [Colors.purple, Colors.blue],
      ),
      BadgeModel(
        title: "Fast Learner",
        icon: FontAwesomeIcons.rocket,
        gradientColors: [Colors.green, Colors.teal],
      ),
      BadgeModel(
        title: "Course Lover",
        icon: FontAwesomeIcons.heart,
        gradientColors: [Colors.pink, Colors.red],
      ),
      BadgeModel(
        title: "Knowledge",
        icon: FontAwesomeIcons.brain,
        gradientColors: [Colors.blueAccent, Colors.indigo],
      ),
      BadgeModel(
        title: "Perfectionist",
        icon: FontAwesomeIcons.gem,
        gradientColors: [Colors.cyan, Colors.tealAccent],
      ),
    ];

    emit(BadgesLoaded(data));
  }
}
