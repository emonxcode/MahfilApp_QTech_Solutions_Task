import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mahfil_app/src/modules/trending_videos/models/trending_videos_model.dart';
import 'package:mahfil_app/src/modules/video_view/controllers/video_player_controller.dart';
import 'package:mahfil_app/src/modules/video_view/views/widgets/thumbnail.dart';
import 'package:mahfil_app/src/modules/video_view/views/widgets/video_view.dart';
import 'package:mahfil_app/src/utils/app_colors.dart';
import 'package:mahfil_app/src/utils/context.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends ConsumerStatefulWidget {
  const VideoPlayerScreen({super.key, required this.video});
  final VideoModel video;

  @override
  ConsumerState<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends ConsumerState<VideoPlayerScreen> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(widget.video.manifest!),
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(videoPlayerProvider);
    var controller = ref.read(videoPlayerProvider);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            children: [
              Stack(
                children: [
                  controller.playVideo
                      ? VideoPlayerView(flickManager: flickManager)
                      : Thumbnail(ref: ref, thumbnail: widget.video.thumbnail!),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        shadows: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: AppColors.blackColor,
                            spreadRadius: 4,
                            blurRadius: 5,
                          )
                        ],
                        size: 30,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
