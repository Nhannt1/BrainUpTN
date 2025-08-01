import 'package:brainup/presentation/pages/your_group/widget/provider_group_header/bloc/group_lesson_event.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_header/bloc/group_lesson_state.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_header/repository/lesson_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LessonRepository repository;

  LessonBloc(this.repository) : super(LessonInitial()) {
    on<LoadLessons>((event, emit) async {
      emit(LessonLoading());
      try {
        final lessons = await repository.fetchLessons(
          subjectName: event.subject,
          grade: event.grade,
        );
        emit(LessonLoaded(
          lessons: lessons,
          colorStart: event.colorStart,
          colorEnd: event.colorEnd,
        ));
      } catch (e) {
        emit(LessonError('Failed to load lessons'));
      }
    });
  }
}
