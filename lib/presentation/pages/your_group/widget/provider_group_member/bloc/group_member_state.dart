import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/model/model_member.dart';

abstract class GroupMembersState {}

class GroupMembersInitial extends GroupMembersState {}

class GroupMembersLoading extends GroupMembersState {}

class GroupMembersLoaded extends GroupMembersState {
  final List<Member> members;
  final bool isOperating; // đang Add/Remove
  final String? message; // thông báo ngắn (success/error)

  GroupMembersLoaded(
    this.members, {
    this.isOperating = false,
    this.message,
  });

  GroupMembersLoaded copyWith({
    List<Member>? members,
    bool? isOperating,
    String? message,
  }) {
    return GroupMembersLoaded(
      members ?? this.members,
      isOperating: isOperating ?? this.isOperating,
      message: message,
    );
  }
}

class GroupMembersError extends GroupMembersState {
  final String message;
  GroupMembersError(this.message);
}
