import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
                  child: Image.network(
                    video.thumbnail!,
                    errorBuilder: (context, error, stackTrace) => Container(),
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
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                leading: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(video.channelImage!,
                        errorBuilder: (context, error, stackTrace) =>
                            Container(),
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
          ],
        ),
      ),
    );
  }
}
