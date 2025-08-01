import 'package:brainup/presentation/pages/videos_lecture/provider/provider_video_player/model/model_videos_lecture.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VideoLectureRepository {
  Future<List<ModelVideoLecture>> fetchVideos({
    required String subject,
    required String grade,
  }) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('subject_group')
        .doc(subject)
        .collection('lessons')
        .doc(grade)
        .collection('videos_lecture')
        .get();

    return snapshot.docs.map((doc) => ModelVideoLecture.fromDoc(doc)).toList();
  }
}
