import 'package:brainup/presentation/pages/videos_lecture/provider/provider_video_player/bloc/video_player_event.dart';
import 'package:brainup/presentation/pages/videos_lecture/provider/provider_video_player/bloc/video_player_state.dart';
import 'package:brainup/presentation/pages/videos_lecture/provider/provider_video_player/repository/video_lecture_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoBloc extends Bloc<VideoPlayerEvent, VideoState> {
  final VideoLectureRepository repository;

  VideoBloc(this.repository) : super(VideoInitial()) {
    on<LoadVideos>(_onLoad);
    on<PlayVideo>(_onPlay);
  }

  Future<void> _onLoad(LoadVideos event, Emitter<VideoState> emit) async {
    emit(VideoLoading());
    try {
      final videos = await repository.fetchVideos(
        subject: event.subject,
        grade: event.grade,
      );

      if (videos.isEmpty) {
        emit(VideoError("No videos found"));
      } else {
        emit(VideoLoaded(videos: videos, selectedVideo: videos.first));
      }
    } catch (e) {
      emit(VideoError("Failed to load videos: $e"));
    }
  }

  void _onPlay(PlayVideo event, Emitter<VideoState> emit) {
    if (state is VideoLoaded) {
      final currentState = state as VideoLoaded;
      emit(
          VideoLoaded(videos: currentState.videos, selectedVideo: event.video));
    }
  }
}
