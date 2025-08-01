import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/model/model_member.dart';

abstract class GroupMembersEvent {}

/// Bắt đầu lắng nghe danh sách members realtime cho 1 subject/grade
class LoadGroupMembers extends GroupMembersEvent {
  final String subject;
  final String grade;
  LoadGroupMembers({required this.subject, required this.grade});
}

/// Event nội bộ: nhận data mới từ stream -> không dispatch từ UI
class MembersStreamUpdated extends GroupMembersEvent {
  final List<Member> members;
  MembersStreamUpdated(this.members);
}

/// Thêm 1 thành viên (uid lấy từ màn search)
class AddMemberRequested extends GroupMembersEvent {
  final String subject;
  final String grade;
  final String uid;
  AddMemberRequested({
    required this.subject,
    required this.grade,
    required this.uid,
  });
}

/// (Tuỳ chọn) Xoá thành viên
class RemoveMemberRequested extends GroupMembersEvent {
  final String subject;
  final String grade;
  final String uid;
  RemoveMemberRequested({
    required this.subject,
    required this.grade,
    required this.uid,
  });
}
