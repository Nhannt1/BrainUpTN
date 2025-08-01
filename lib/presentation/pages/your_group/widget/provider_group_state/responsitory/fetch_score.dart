import 'package:brainup/presentation/pages/your_group/widget/provider_group_state/model/status_score.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupStatsRepository {
  Future<GroupStats> fetchGroupStats({
    required String subject,
    required String grade,
  }) async {
    final statusRef = FirebaseFirestore.instance
        .collection('subject_group')
        .doc(subject)
        .collection('lessons')
        .doc(grade)
        .collection('status');

    final memberSnap = await statusRef.doc('member').get();

    final completeSnap = await statusRef.doc('complete').get();

    final avgSnap = await statusRef.doc('avg_score').get();

    final memberCount =
        int.tryParse(memberSnap.data()!['acount'].toString()) ?? 0;
    final completedCount =
        int.tryParse(completeSnap.data()!['acount'].toString()) ?? 0;
    final avgScore = int.tryParse(avgSnap.data()!['acount'].toString()) ?? 0;

    return GroupStats(
      members: memberCount,
      completed: completedCount,
      avgScore: avgScore,
    );
  }
}
