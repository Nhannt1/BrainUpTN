import 'package:brainup/presentation/pages/your_group/widget/provider_group_state/model/status_score.dart';

abstract class GroupStatsState {}

class GroupStatsInitial extends GroupStatsState {}

class GroupStatsLoading extends GroupStatsState {}

class GroupStatsLoaded extends GroupStatsState {
  final GroupStats stats;
  GroupStatsLoaded(this.stats);
}

class GroupStatsError extends GroupStatsState {
  final String message;
  GroupStatsError(this.message);
}
