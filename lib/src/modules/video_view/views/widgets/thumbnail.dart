import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mahfil_app/src/modules/video_view/controllers/video_player_controller.dart';
import 'package:mahfil_app/src/utils/context.dart';

import '../../../../utils/app_colors.dart';

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    super.key,
    required this.ref,
    required this.thumbnail,
  });
  final WidgetRef ref;
  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          thumbnail,
          errorBuilder: (context, error, stackTrace) => Container(),
        ),
        SizedBox(
          height: 250,
          width: context.width,
          child: Center(
            child: IconButton(
              onPressed: () {
                ref.read(videoPlayerProvider).setPlayer(true);
              },
              icon: const Icon(
                Icons.play_circle,
                size: 80,
                color: AppColors.redColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
