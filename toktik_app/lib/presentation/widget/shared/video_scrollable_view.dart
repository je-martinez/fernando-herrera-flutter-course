import 'package:flutter/material.dart';
import 'package:toktik_app/domain/entities/video_post.dart';
import 'package:toktik_app/presentation/widget/shared/video_buttons.dart';
import 'package:toktik_app/presentation/widget/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videosPost;

  const VideoScrollableView({super.key, required this.videosPost});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videosPost.length,
      itemBuilder: (context, index) {
        final videoPost = videosPost[index];
        return Stack(
          children: [
            SizedBox.expand(
                child: FullScreenPlayer(
                    caption: videoPost.caption, videoUrl: videoPost.videoUrl)),
            Positioned(
                bottom: 40,
                right: 20,
                child: VideoButtons(
                  likes: videoPost.likes,
                  views: videoPost.views,
                )),
          ],
        );
      },
    );
  }
}
