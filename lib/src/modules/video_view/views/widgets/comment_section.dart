import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mahfil_app/src/utils/context.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/sizes.dart';
import '../../../../widgets/app_text_widget.dart';
import '../../../trending_videos/views/widgets/image_shimmer_loader.dart';
import '../../controllers/video_player_controller.dart';

class CommentSection extends ConsumerWidget {
  const CommentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(videoPlayerProvider);
    return Column(
      children: [
        InkWell(
          onTap: () {
            ref.watch(videoPlayerProvider).setCommentSectionVisibility();
          },
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                AppSpace.spaceW12,
                const AppTextWidget(text: "Comments 7.5K"),
                const Spacer(),
                Icon(ref.read(videoPlayerProvider).showCommentSection
                    ? Icons.keyboard_arrow_up_outlined
                    : Icons.keyboard_arrow_down_outlined),
                AppSpace.spaceW10,
              ],
            ),
          ),
        ),
        AppSpace.spaceH10,
        if (ref.read(videoPlayerProvider).showCommentSection)
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppSpace.spaceW12,
                  SizedBox(
                    height: 50,
                    width: context.width - 24,
                    child: Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          hintText: "Add comment",
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.send,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(width: 2, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AppSpace.spaceH10,
              ListTile(
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const ImageCachedWithShimmerLoader(
                        imageUrl:
                            'https://pbs.twimg.com/media/EXuNLbdUMAAzrmg.jpg',
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                ),
                title: const AppTextWidget(
                  text: "Mizanur Rahman Azhari",
                  fontWeight: FontWeight.bold,
                  maxLines: 2,
                  fontSize: 15,
                ),
                subtitle: const Text(
                    "আমরা বাংলায় ওয়েব ডেডলপমেন্ট নিয়ে কাজ করতে গিয়ে প্রথম যে সমস্যাটার মুখোমুখি হই, সেটা হলো, বাংলা ডেমো টেক্সট। ইংরেজির জন্য lorem ipsum তো আছে ।"),
              ),
            ],
          ),
      ],
    );
  }
}
