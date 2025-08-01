import '../model/model_videos_lecture.dart';

abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {
  final List<ModelVideoLecture> videos;
  final ModelVideoLecture selectedVideo;

  VideoLoaded({required this.videos, required this.selectedVideo});
}

class VideoError extends VideoState {
  final String message;

  VideoError(this.message);
}
