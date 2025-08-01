import 'package:brainup/presentation/pages/your_group/widget/provider_group_header/model/lesson_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LessonRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Lesson>> fetchLessons({
    required String subjectName,
    required String grade,
  }) async {
    final snapshot = await _firestore
        .collection('subject_group')
        .doc(subjectName)
        .collection('lessons')
        .doc(grade)
        .collection('lessons')
        .get();

    return snapshot.docs.map((doc) => Lesson.fromMap(doc.data())).toList();
  }
}
