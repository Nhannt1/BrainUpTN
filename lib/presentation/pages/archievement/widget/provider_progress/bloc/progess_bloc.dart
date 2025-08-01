import 'package:brainup/presentation/pages/archievement/widget/provider_progress/model/progress_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'progress_event.dart';
import 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  ProgressBloc() : super(ProgressInitial()) {
    on<LoadProgress>(_onLoadProgress);
  }

  void _onLoadProgress(LoadProgress event, Emitter<ProgressState> emit) async {
    emit(ProgressLoading());

    await Future.delayed(Duration(milliseconds: 500)); // fake API

    try {
      final progress =
          ProgressModel(completedCourses: 12, inProgressCourses: 6);
      emit(ProgressLoaded(progress));
    } catch (e) {
      emit(ProgressError("Failed to load progress data"));
    }
  }
}
