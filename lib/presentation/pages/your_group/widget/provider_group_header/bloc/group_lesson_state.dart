import 'dart:ui';

import 'package:brainup/presentation/pages/your_group/widget/provider_group_header/model/lesson_model.dart';

abstract class LessonState {}

class LessonInitial extends LessonState {}

class LessonLoading extends LessonState {}

class LessonLoaded extends LessonState {
  final List<Lesson> lessons;
  final Color colorStart;
  final Color colorEnd;

  LessonLoaded(
      {required this.lessons,
      required this.colorStart,
      required this.colorEnd});
}

class LessonError extends LessonState {
  final String message;
  LessonError(this.message);
}
