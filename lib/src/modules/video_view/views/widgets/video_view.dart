import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:mahfil_app/src/utils/app_colors.dart';
import 'package:mahfil_app/src/utils/context.dart';

class VideoPlayerView extends StatelessWidget {
  const VideoPlayerView({
    super.key,
    required this.flickManager,
  });

  final FlickManager flickManager;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: context.width,
      color: AppColors.blackColor,
      child: ClipRRect(
        child: FlickVideoPlayer(
          flickManager: flickManager,
          wakelockEnabled: true,
          flickVideoWithControls: const FlickVideoWithControls(
            videoFit : BoxFit.cover,
            controls: FlickPortraitControls(),
          ),
        ),
      ),
    );
  }
}
