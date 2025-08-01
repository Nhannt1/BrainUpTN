import 'package:cloud_firestore/cloud_firestore.dart';

enum MemberStatus { active, away }

class Member {
  final String id; // uid hoặc docId cũ
  final String name; // field 'name' mới hoặc fallback docId
  final int completion; // % complete (0..100)
  final MemberStatus status;
  final String avatar;

  Member({
    required this.id,
    required this.name,
    required this.completion,
    required this.status,
    required this.avatar,
  });

  factory Member.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? <String, dynamic>{};
    return Member(
      id: doc.id,
      name: (data['name'] ?? doc.id)
          .toString(), // dữ liệu cũ không có 'name' → dùng docId
      avatar: (data['avatar'] ?? '').toString(),
      completion: _parseCompletion(data['complete']),
      status: _statusFromString(data['status']),
    );
  }

  static int _parseCompletion(dynamic v) {
    if (v is int) return v;
    if (v is double) return v.round();
    if (v is String) return int.tryParse(v) ?? 0;
    return 0;
  }

  static MemberStatus _statusFromString(dynamic value) {
    final str = (value ?? '').toString().toLowerCase();
    switch (str) {
      case 'active':
        return MemberStatus.active;
      case 'away':
        return MemberStatus.away;
      default:
        return MemberStatus.away;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'avatar': avatar,
      'status': status.name, // lưu chuỗi: 'active' | 'away'
      'complete': completion,
    };
  }
}
