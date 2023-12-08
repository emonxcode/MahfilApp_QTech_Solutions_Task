import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/sizes.dart';
import '../../../../widgets/app_text_widget.dart';
import '../../../trending_videos/views/widgets/image_shimmer_loader.dart';
import '../video_player_screen.dart';

class ChannelPanel extends StatelessWidget {
  const ChannelPanel({
    super.key,
    required this.widget,
  });

  final VideoPlayerScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            leading: SizedBox(
              height: 45,
              width: 45,
              child: CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: ImageCachedWithShimmerLoader(
                    imageUrl: widget.video.channelImage!,
                    height: 45,
                    width: 45,
                  ),
                ),
              ),
            ),
            title: AppTextWidget(
              text: widget.video.channelName!,
              fontWeight: FontWeight.bold,
              maxLines: 2,
              fontSize: 16,
            ),
            subtitle: Text("${widget.video.channelSubscriber!} Subscribers"),
          ),
        ),
        Container(
          height: 45,
          width: 125,
          margin: const EdgeInsets.only(right: 10),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Colors.blue),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.whiteColor,
                ),
                AppSpace.spaceW6,
                AppTextWidget(
                  text: "Subscribe",
                  color: AppColors.whiteColor,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
