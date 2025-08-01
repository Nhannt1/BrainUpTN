import 'package:brainup/presentation/pages/your_group/widget/provider_group_state/bloc/group_state_event.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_state/bloc/group_state_state.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_state/responsitory/fetch_score.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class GroupStatsBloc extends Bloc<GroupStatsEvent, GroupStatsState> {
  final GroupStatsRepository repository;
  GroupStatsBloc(this.repository) : super(GroupStatsInitial()) {
    on<LoadGroupStatse>((event, emit) async {
      emit(GroupStatsLoading());
      try {
        final stats = await repository.fetchGroupStats(
          subject: event.subject,
          grade: event.grade,
        );
        emit(GroupStatsLoaded(
          stats,
        ));
      } catch (e) {
        emit(GroupStatsError('Lỗi load điểm: $e'));
      }
    });
  }
}
