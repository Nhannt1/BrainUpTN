import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'package:brainup/presentation/pages/videos_lecture/provider/provider_video_player/bloc/video_player_bloc.dart';
import 'package:brainup/presentation/pages/videos_lecture/provider/provider_video_player/bloc/video_player_event.dart';
import 'package:brainup/presentation/pages/videos_lecture/provider/provider_video_player/bloc/video_player_state.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_study_material/subject_infor.dart';

class VideoPlayerSection extends StatefulWidget {
  const VideoPlayerSection({super.key});

  @override
  State<VideoPlayerSection> createState() => _VideoPlayerSectionState();
}

class _VideoPlayerSectionState extends State<VideoPlayerSection> {
  late SubjectInfo info;
  YoutubePlayerController? _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final extra = GoRouterState.of(context).extra;
    if (extra is SubjectInfo) {
      info = extra;
      context.read<VideoBloc>().add(
            LoadVideos(subject: info.subject, grade: info.grade),
          );
    }
  }

  @override
  void dispose() {
    _controller?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {
        if (state is VideoLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is VideoLoaded) {
          final selected = state.selectedVideo;

          if (_controller == null) {
            // Khởi tạo controller lần đầu
            _controller = YoutubePlayerController.fromVideoId(
              videoId: selected.videoId,
              params: const YoutubePlayerParams(
                showControls: true,
                showFullscreenButton: false,
                mute: false,
                enableCaption: false,
                showVideoAnnotations: false,
              ),
            );
          } else if (_controller!.metadata.videoId != selected.videoId) {
            // Nếu videoId khác thì load video mới
            _controller!.loadVideoById(videoId: selected.videoId);
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayerScaffold(
                controller: _controller!,
                builder: (context, player) {
                  return AspectRatio(
                    aspectRatio: 16 / 9,
                    child: player,
                  );
                },
              ),
              const SizedBox(height: 16),
              Text(
                selected.title, // title mới sẽ rebuild
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.visibility, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    "${selected.views} views",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const Spacer(),
                  const Icon(Icons.thumb_up, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    selected.like,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.share, size: 16, color: Colors.grey),
                ],
              ),
            ],
          );
        }

        if (state is VideoError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox();
      },
    );
  }
}
