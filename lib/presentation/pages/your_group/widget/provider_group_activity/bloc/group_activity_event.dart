abstract class RecentActivityEvent {}

class LoadRecentActivities extends RecentActivityEvent {
  final String subject;
  final String grade;

  LoadRecentActivities({required this.subject, required this.grade});
}
