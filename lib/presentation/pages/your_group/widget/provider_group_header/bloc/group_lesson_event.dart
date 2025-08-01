import 'dart:ui';

abstract class LessonEvent {}

class LoadLessons extends LessonEvent {
  final String subject;
  final String grade;
  final Color colorStart;
  final Color colorEnd;
  LoadLessons({
    required this.subject,
    required this.grade,
    required this.colorStart,
    required this.colorEnd,
  });
}
