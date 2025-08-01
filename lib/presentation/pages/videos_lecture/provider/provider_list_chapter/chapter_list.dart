import 'package:brainup/presentation/pages/videos_lecture/provider/provider_video_player/bloc/video_player_bloc.dart';
import 'package:brainup/presentation/pages/videos_lecture/provider/provider_video_player/bloc/video_player_event.dart';
import 'package:brainup/presentation/pages/videos_lecture/provider/provider_video_player/bloc/video_player_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChaptersList extends StatelessWidget {
  const ChaptersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {
        if (state is VideoLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is! VideoLoaded) {
          return const SizedBox.shrink();
        }
        final videos = state.videos;
        final current = state.selectedVideo;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chapters',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
           
            SizedBox(
                height: 250,
                child: ListView.builder(
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      final video = videos[index];
                      final isActive = video.videoId == current.videoId;
                      return GestureDetector(
                        onTap: () {
                          context.read<VideoBloc>().add(PlayVideo(video));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          decoration: BoxDecoration(
                            color: isActive
                                ? Colors.blue.shade50
                                : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color:
                                  isActive ? Colors.blue : Colors.transparent,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_circle_fill,
                                color: isActive ? Colors.blue : Colors.grey,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      video.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "0:0 - ${video.duration}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.play_arrow,
                                  size: 20, color: Colors.grey),
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        );
      },
    );
  }
}
