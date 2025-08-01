import 'package:brainup/presentation/pages/videos_lecture/provider/provider_list_chapter/chapter_list.dart';
import 'package:brainup/presentation/pages/videos_lecture/widget/document_list.dart';
import 'package:brainup/presentation/pages/videos_lecture/widget/resource_attachment.dart';
import 'package:brainup/presentation/pages/videos_lecture/provider/provider_video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideosLecturePage extends StatelessWidget {
  const VideosLecturePage({super.key});
  static const rootLocation = '/VideosLecturePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Lecture'),
        leading: BackButton(),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            VideoPlayerSection(),
            SizedBox(height: 16),
            ChaptersList(),
            SizedBox(height: 16),
            ResourcesAttachments(),
            SizedBox(height: 16),
            DocumentsList(),
          ],
        ),
      ),
    );
  }
}
