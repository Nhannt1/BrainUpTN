import '../model/badge_model.dart';

abstract class EarnedBadgesState {}

class BadgesInitial extends EarnedBadgesState {}

class BadgesLoading extends EarnedBadgesState {}

class BadgesLoaded extends EarnedBadgesState {
  final List<BadgeModel> badges;

  BadgesLoaded(this.badges);
}

class BadgesError extends EarnedBadgesState {
  final String message;

  BadgesError(this.message);
}
