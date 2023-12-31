import 'dart:ui';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mahfil_app/src/modules/trending_videos/models/trending_videos_model.dart';
import 'package:mahfil_app/src/modules/video_view/controllers/video_player_controller.dart';
import 'package:mahfil_app/src/modules/video_view/views/widgets/thumbnail.dart';
import 'package:mahfil_app/src/modules/video_view/views/widgets/video_view.dart';
import 'package:mahfil_app/src/utils/app_colors.dart';
import 'package:mahfil_app/src/utils/context.dart';
import 'package:mahfil_app/src/utils/sizes.dart';
import 'package:mahfil_app/src/widgets/app_text_widget.dart';
import 'package:video_player/video_player.dart';

import '../../trending_videos/views/widgets/image_shimmer_loader.dart';
import 'widgets/action_button.dart';
import 'widgets/channel_pannel.dart';
import 'widgets/comment_section.dart';

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
      backgroundColor: AppColors.scaffoldBackGroundColor,
      body: SafeArea(
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    controller.playVideo
                        ? VideoPlayerView(flickManager: flickManager)
                        : Thumbnail(
                            ref: ref, thumbnail: widget.video.thumbnail!),
                    const BackButton(),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: AppTextWidget(
                    text: widget.video.title!,
                    fontSize: 20,
                    maxLines: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: AppTextWidget(
                    text:
                        "${widget.video.viewers!} Views . ${(DateTime.now().difference(DateTime.parse(widget.video.createdAt!)).inDays)} days ago",
                    fontSize: 14,
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      ActionButton(
                        label: "MASH ALLAH",
                        icon: Icons.favorite_outline,
                        width: 120,
                        onTap: () {},
                      ),
                      Expanded(
                        child: ActionButton(
                          label: "LIKE",
                          icon: Icons.thumb_up_outlined,
                          width: null,
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        child: ActionButton(
                          label: "SHARE",
                          icon: Icons.share_outlined,
                          width: null,
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        child: ActionButton(
                          label: "REPORT",
                          icon: Icons.flag_outlined,
                          width: null,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                AppSpace.spaceH10,
                ChannelPanel(widget: widget),
                const Divider(
                  thickness: 1,
                  color: Color.fromARGB(255, 231, 231, 231),
                ),
                AppSpace.spaceH10,
                const CommentSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}
