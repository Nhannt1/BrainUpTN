import '../model/achievement_model.dart';

abstract class RecentAchievementsState {}

class AchievementsInitial extends RecentAchievementsState {}

class AchievementsLoading extends RecentAchievementsState {}

class AchievementsLoaded extends RecentAchievementsState {
  final List<AchievementModel> achievements;

  AchievementsLoaded(this.achievements);
}

class AchievementsError extends RecentAchievementsState {
  final String message;

  AchievementsError(this.message);
}
