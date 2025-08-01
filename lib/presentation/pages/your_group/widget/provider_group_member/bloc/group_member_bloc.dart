import 'dart:async';

import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/model/model_member.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/bloc/group_member_event.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/bloc/group_member_state.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/repository/member_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupMembersBloc extends Bloc<GroupMembersEvent, GroupMembersState> {
  final GroupMemberRepository repository;
  StreamSubscription<List<Member>>? _sub;

  GroupMembersBloc(this.repository) : super(GroupMembersInitial()) {
    on<LoadGroupMembers>(_onLoadMembers);
    on<MembersStreamUpdated>(_onMembersUpdated);
    on<AddMemberRequested>(_onAddMemberRequested);
    on<RemoveMemberRequested>(_onRemoveMemberRequested);
  }

  Future<void> _onLoadMembers(
    LoadGroupMembers event,
    Emitter<GroupMembersState> emit,
  ) async {
    // Huỷ stream cũ nếu đang nghe
    await _sub?.cancel();
    emit(GroupMembersLoading());

    try {
      // Bắt đầu nghe realtime
      _sub = repository.streamMembers(event.subject, event.grade).listen(
            (members) => add(MembersStreamUpdated(members)),
            onError: (e) => addError(e, StackTrace.current),
          );
    } catch (e) {
      emit(GroupMembersError("Lỗi load thành viên: $e"));
    }
  }

  void _onMembersUpdated(
    MembersStreamUpdated event,
    Emitter<GroupMembersState> emit,
  ) {
    // Nếu đang ở lỗi/initial, chuyển sang loaded
    final prev = state;
    if (prev is GroupMembersLoaded) {
      emit(prev.copyWith(
          members: event.members, isOperating: false, message: null));
    } else {
      emit(GroupMembersLoaded(event.members));
    }
  }

  Future<void> _onAddMemberRequested(
    AddMemberRequested event,
    Emitter<GroupMembersState> emit,
  ) async {
    final prev = state;
    if (prev is GroupMembersLoaded) {
      emit(prev.copyWith(isOperating: true, message: null));
    }

    try {
      await repository.addMemberByUid(
        subject: event.subject,
        grade: event.grade,
        uid: event.uid,
      );
      // Không cần refetch: stream sẽ đẩy danh sách mới -> MembersStreamUpdated
      if (state is GroupMembersLoaded) {
        final s = state as GroupMembersLoaded;
        emit(s.copyWith(isOperating: false, message: "Đã thêm thành viên"));
      }
    } catch (e) {
      if (state is GroupMembersLoaded) {
        final s = state as GroupMembersLoaded;
        emit(s.copyWith(isOperating: false, message: "Thêm thất bại: $e"));
      } else {
        emit(GroupMembersError("Thêm thất bại: $e"));
      }
    }
  }

  Future<void> _onRemoveMemberRequested(
    RemoveMemberRequested event,
    Emitter<GroupMembersState> emit,
  ) async {
    final prev = state;
    if (prev is GroupMembersLoaded) {
      emit(prev.copyWith(isOperating: true, message: null));
    }

    try {
      await repository.removeMember(
        subject: event.subject,
        grade: event.grade,
        uid: event.uid,
      );
      if (state is GroupMembersLoaded) {
        final s = state as GroupMembersLoaded;
        emit(s.copyWith(isOperating: false, message: "Đã xoá thành viên"));
      }
    } catch (e) {
      if (state is GroupMembersLoaded) {
        final s = state as GroupMembersLoaded;
        emit(s.copyWith(isOperating: false, message: "Xoá thất bại: $e"));
      } else {
        emit(GroupMembersError("Xoá thất bại: $e"));
      }
    }
  }

  @override
  Future<void> close() async {
    await _sub?.cancel();
    return super.close();
  }
}
