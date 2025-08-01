import 'dart:ui';

abstract class GroupStatsEvent {}

class LoadGroupStatse extends GroupStatsEvent {
  final String subject;
  final String grade;

  LoadGroupStatse({
    required this.subject,
    required this.grade,
  });
}

// class LoadAllStatusScores extends GroupStatsEvent {
//   final String subject;
//   final String grade;

//   LoadAllStatusScores({required this.subject, required this.grade});
// }
// class UpdateMembers extends GroupStatsEvent {
//   final int newCount;
//   UpdateMembers(this.newCount);
// }

// class UpdateCompleted extends GroupStatsEvent {
//   final int completed;
//   UpdateCompleted(this.completed);
// }

// class UpdateAvgScore extends GroupStatsEvent {
//   final int avgScore;
//   UpdateAvgScore(this.avgScore);
// }
