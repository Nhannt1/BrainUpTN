import 'package:cloud_firestore/cloud_firestore.dart';

class ModelVideoLecture {
  final String title;
  final String videoId;
  final String views;
  final String thumbnail;
  final String duration;
  final String like;
  ModelVideoLecture(
      {required this.title,
      required this.videoId,
      required this.views,
      required this.like,
      required this.thumbnail,
      required this.duration});

  factory ModelVideoLecture.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ModelVideoLecture(
      title: data['title'] ?? '',
      videoId: data['videoId'] ?? '',
      views: data['views'] ?? 0,
      duration: data['duration'] ?? '',
      like: data['like'] ?? 0,
      thumbnail: data['thumbnail'] ?? '',
    );
  }
}
