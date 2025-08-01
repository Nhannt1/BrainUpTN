import 'package:brainup/presentation/pages/your_group/widget/provider_group_activity/model_activity/model_activity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityRepository {
  Future<List<Activity>> fetchAllActivities({
    required String subject,
    required String grade,
  }) async {
    final activities = <Activity>[];

    final activitySnap = await FirebaseFirestore.instance
        .collection('subject_group')
        .doc(subject)
        .collection('lessons')
        .doc(grade)
        .collection('activity')
        .get();

    for (var doc in activitySnap.docs) {
      activities.add(Activity.fromDoc(doc));
    }

    return activities;
  }
}
