import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mahfil_app/src/modules/trending_videos/views/widgets/image_shimmer_loader.dart';
import 'package:mahfil_app/src/modules/video_view/views/video_player_screen.dart';
import 'package:mahfil_app/src/utils/context.dart';
import '../../../../utils/app_colors.dart';
import '../../../../widgets/app_text_widget.dart';
import '../../models/trending_videos_model.dart';

class TrendingVideoItemView extends StatelessWidget {
  const TrendingVideoItemView({
    super.key,
    required this.video,
  });

  final VideoModel video;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(VideoPlayerScreen(video: video));
      },
      child: Container(
        height: 300,
        width: context.width,
        margin: const EdgeInsets.only(bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: context.width,
                  child: CachedNetworkImage(
                    imageUrl: video.thumbnail!,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            ImageCachedWithShimmerLoader(
                      imageUrl: video.thumbnail!,
                      height: 200,
                      width: context.width,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    height: 25,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.blackColor,
                    ),
                    child: Center(
                      child: AppTextWidget(
                        text: video.duration!,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //    AppSpace.spaceH4,
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: ImageCachedWithShimmerLoader(
                              imageUrl: video.channelImage!,
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ),
                      ),
                      title: AppTextWidget(
                        text: video.title!,
                        fontWeight: FontWeight.bold,
                        maxLines: 2,
                        fontSize: 15,
                      ),
                      subtitle: Text(
                          "${video.viewers!} Views . ${DateFormat('MMM dd, yyy').format(DateTime.parse(video.createdAt!))}"),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
