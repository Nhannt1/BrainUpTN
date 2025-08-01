import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/model/model_member.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/model/model_member.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserLite {
  final String uid;
  final String name;
  final String avatar;
  UserLite({required this.uid, required this.name, required this.avatar});

  factory UserLite.fromDoc(DocumentSnapshot<Map<String, dynamic>> d) {
    final data = d.data() ?? {};
    return UserLite(
      uid: d.id,
      name: (data['fullname'] ?? '').toString(),
      avatar: (data['image'] ?? '').toString(),
    );
  }
}

class GroupMemberRepository {
  GroupMemberRepository();

  /// Collection members có converter theo model Member
  CollectionReference<Member> _memberCol(String subject, String grade) {
    return FirebaseFirestore.instance
        .collection('subject_group')
        .doc(subject)
        .collection('lessons')
        .doc(grade)
        .collection('member')
        .withConverter<Member>(
          fromFirestore: (snap, _) => Member.fromDoc(snap),
          toFirestore: (m, _) => m.toMap(),
        );
  }

  DocumentReference<Map<String, dynamic>> _gradeDoc(
      String subject, String grade) {
    return FirebaseFirestore.instance
        .collection('subject_group')
        .doc(subject)
        .collection('lessons')
        .doc(grade);
  }

  /// Lấy 1 lần (non‑realtime)
  Future<List<Member>> fetchMembers(String subject, String grade) async {
    final snapshot = await _memberCol(subject, grade).orderBy('name').get();
    return snapshot.docs.map((d) => d.data()).toList();
  }

  /// Realtime stream cho UI
  Stream<List<Member>> streamMembers(String subject, String grade) {
    return _memberCol(subject, grade)
        .orderBy('name') // FIX: trước là 'fullname' -> phải là 'name'
        .snapshots()
        .map((s) => s.docs.map((d) => d.data()).toList());
  }

  /// Kiểm tra đã là member chưa
  Future<bool> isMember({
    required String subject,
    required String grade,
    required String uid,
  }) async {
    final doc = await _memberCol(subject, grade).doc(uid).get();
    return doc.exists;
  }

  /// Tìm user theo TÊN (prefix, không phân biệt hoa/thường)
  Future<List<UserLite>> searchUsersByNamePrefix(String query,
      {int limit = 30}) async {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return [];
    final snap = await FirebaseFirestore.instance
        .collection('users')
        .orderBy('fullname_lower') // cần field & index
        .startAt([q])
        .endAt(['$q\uf8ff'])
        .limit(limit)
        .get();
    return snap.docs
        .map((d) =>
            UserLite.fromDoc(d as DocumentSnapshot<Map<String, dynamic>>))
        .toList();
  }

  /// (tuỳ chọn) Thêm theo TÊN chính xác (nếu bạn KHÔNG làm UI chọn từ list).
  Future<void> addMemberByExactName({
    required String subject,
    required String grade,
    required String exactName,
  }) async {
    final snap = await FirebaseFirestore.instance
        .collection('users')
        .where('fullname', isEqualTo: exactName)
        .limit(2)
        .get();

    if (snap.docs.isEmpty) {
      throw Exception('Không tìm thấy user tên: $exactName');
    }
    if (snap.docs.length > 1) {
      throw Exception(
          'Tên "$exactName" trùng nhiều người. Hãy chọn theo danh sách.');
    }

    final uid = snap.docs.first.id; // giả định docId = uid
    await addMemberByUid(subject: subject, grade: grade, uid: uid);
  }

  /// Add member theo UID người dùng.
  /// - Lấy name/avatar từ users/{uid} (có fallback nếu docId != uid)
  /// - Ghi vào lessons/{grade}/member/{uid}
  /// - Tăng membersCount ở doc grade
  Future<void> addMemberByUid({
    required String subject,
    required String grade,
    required String uid,
    String initialStatus = 'Active',
  }) async {
    final db = FirebaseFirestore.instance;

    // 1) lấy user
    var userSnap = await db.collection('users').doc(uid).get();
    if (!userSnap.exists) {
      // FIX: fallback nếu users không dùng docId = uid
      final byField = await db
          .collection('users')
          .where('uid', isEqualTo: uid)
          .limit(1)
          .get();
      if (byField.docs.isEmpty) {
        throw Exception('User $uid không tồn tại');
      }
      userSnap = byField.docs.first;
    }

    final u = userSnap.data()!;
    final name = (u['fullname'] ?? '').toString();
    final avatar = (u['image'] ?? '').toString();

    // 2) refs
    final memberRef =
        _memberCol(subject, grade).doc(uid); // DocumentReference<Member>
    final gradeRef = _gradeDoc(subject, grade); // DocumentReference<Map>

    // Map initialStatus -> enum
    MemberStatus _mapStatus(String s) {
      switch (s.toLowerCase()) {
        case 'active':
          return MemberStatus.active;
        case 'away':
          return MemberStatus.away;
        case 'offline':
          return MemberStatus.away; // nếu enum của bạn có offline
        default:
          return MemberStatus.away;
      }
    }

    // 3) transaction
    await db.runTransaction((tx) async {
      final cur = await tx.get(memberRef);
      if (!cur.exists) {
        tx.set(
          memberRef,
          Member(
            id: uid,
            name: name.isEmpty ? uid : name,
            avatar: avatar,
            status:
                _mapStatus(initialStatus), // FIX: dùng tham số initialStatus
            completion: 0,
          ),
        );

        tx.set(
          gradeRef,
          {'membersCount': FieldValue.increment(1)},
          SetOptions(merge: true),
        );
      } else {
        tx.update(memberRef, {
          'name': name.isEmpty ? uid : name,
          'avatar': avatar,
        });
      }
    });
  }

  Future<Set<String>> memberUidSet(String subject, String grade) async {
    final snap = await _memberCol(subject, grade).get();
    return snap.docs.map((d) => d.id).toSet();
  }

  Future<List<UserLite>> listUsersNotInGroup({
    required String subject,
    required String grade,
    int limit = 20,
    String? startAfterNameLower,
  }) async {
    Query<Map<String, dynamic>> q = FirebaseFirestore.instance
        .collection('users')
        .orderBy('fullname_lower');

    if (startAfterNameLower != null && startAfterNameLower.isNotEmpty) {
      q = q.startAfter([startAfterNameLower]);
    }

    final snap = await q.limit(limit).get();
    final existing = await memberUidSet(subject, grade);
    final all = snap.docs.map((d) => UserLite.fromDoc(d)).toList();
    return all.where((u) => !existing.contains(u.uid)).toList();
  }

  Future<List<UserLite>> searchUsersByNamePrefixNotInGroup({
    required String subject,
    required String grade,
    required String query,
    int limit = 30,
  }) async {
    final qText = query.trim().toLowerCase();
    if (qText.isEmpty) return [];
    final snap = await FirebaseFirestore.instance
        .collection('users')
        .orderBy('fullname')
        .startAt([qText])
        .endAt(['$qText\uf8ff'])
        .limit(limit)
        .get();
    final existing = await memberUidSet(subject, grade);
    final results = snap.docs.map((d) => UserLite.fromDoc(d)).toList();
    return results.where((u) => !existing.contains(u.uid)).toList();
  }

  /// Xoá member
  Future<void> removeMember({
    required String subject,
    required String grade,
    required String uid,
  }) async {
    final db = FirebaseFirestore.instance;
    final memberRef = _memberCol(subject, grade).doc(uid);
    final gradeRef = _gradeDoc(subject, grade);

    await db.runTransaction((tx) async {
      final cur = await tx.get(memberRef);
      if (cur.exists) {
        tx.delete(memberRef);
        tx.set(
          gradeRef,
          {'membersCount': FieldValue.increment(-1)},
          SetOptions(merge: true),
        );
      }
    });
  }
}
