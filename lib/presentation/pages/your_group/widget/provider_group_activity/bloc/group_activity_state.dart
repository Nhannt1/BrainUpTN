import 'package:brainup/presentation/pages/your_group/widget/provider_group_activity/model_activity/model_activity.dart';

abstract class RecentActivityState {}

class RecentActivityInitial extends RecentActivityState {}

class RecentActivityLoading extends RecentActivityState {}

class RecentActivityLoaded extends RecentActivityState {
  final List<Activity> activities;

  RecentActivityLoaded(this.activities);
}

class RecentActivityError extends RecentActivityState {
  final String message;

  RecentActivityError(this.message);
}
