import 'package:brainup/presentation/pages/videos_lecture/provider/provider_video_player/model/model_videos_lecture.dart';

abstract class VideoPlayerEvent {}

class LoadVideos extends VideoPlayerEvent {
  final String subject;
  final String grade;

  LoadVideos({required this.subject, required this.grade});
}

class PlayVideo extends VideoPlayerEvent {
  final ModelVideoLecture video;

  PlayVideo(this.video);
}
