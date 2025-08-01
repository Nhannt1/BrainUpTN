import 'package:brainup/presentation/pages/your_group/widget/provider_group_activity/bloc/group_activity_event.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_activity/bloc/group_activity_state.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_activity/model_activity/model_activity.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_activity/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentActivityBloc
    extends Bloc<RecentActivityEvent, RecentActivityState> {
  final ActivityRepository repository;
  RecentActivityBloc(this.repository) : super(RecentActivityInitial()) {
    on<LoadRecentActivities>(_onLoadActivities);
  }

  Future<void> _onLoadActivities(
      LoadRecentActivities event, Emitter<RecentActivityState> emit) async {
    emit(RecentActivityLoading());

    await Future.delayed(const Duration(seconds: 1)); // giả lập loading

    try {
      final acitivty = await repository.fetchAllActivities(
          grade: event.grade, subject: event.subject);

      emit(RecentActivityLoaded(acitivty));
    } catch (e) {
      emit(RecentActivityError("Failed to load activities"));
    }
  }
}
