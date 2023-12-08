import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mahfil_app/src/modules/trending_videos/models/trending_videos_model.dart';
import 'package:mahfil_app/src/utils/app_colors.dart';
import 'package:mahfil_app/src/utils/context.dart';
import 'package:mahfil_app/src/utils/sizes.dart';
import 'package:mahfil_app/src/widgets/app_text_widget.dart';
import '../../../widgets/shimmer_loader.dart';
import '../controllers/trending_videos_provider.dart';
import 'widgets/trending_video_item_view.dart';

class TrendingVideosScreen extends ConsumerStatefulWidget {
  const TrendingVideosScreen({super.key});

  @override
  ConsumerState<TrendingVideosScreen> createState() => _TrendingVideosState();
}

class _TrendingVideosState extends ConsumerState<TrendingVideosScreen> {
  bool isDataLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setupScrollController(context);
    if (isDataLoaded == false) {
      isDataLoaded = true;
      Future.delayed(Duration.zero).then(
        (value) => ref.read(trendingVideosProvider).getTrendingVideos(context),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(trendingVideosProvider);
    var controller = ref.read(trendingVideosProvider.notifier);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackGroundColor,
      body: SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              AppSpace.spaceH16,
              const Align(
                alignment: Alignment.topLeft,
                child: AppTextWidget(
                  text: "Trending Videos",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpace.spaceH16,
              Expanded(
                child: controller.isLoading == false
                    ? controller.trendingVideoModel != null
                        ? ListView.builder(
                            controller: controller.scrollController,
                            physics: const BouncingScrollPhysics(),
                            itemCount:
                                controller.trendingVideoModel!.results!.length,
                            itemBuilder: (context, index) {
                              if (index <
                                  controller
                                      .trendingVideoModel!.results!.length) {
                                var video = controller
                                    .trendingVideoModel!.results![index];

                                return TrendingVideoItemView(video: video);
                              } else {
                                return const SizedBox(height: 60);
                              }
                            },
                          )
                        : const Center(
                            child: Text("No videos"),
                          )
                    : const ShimmerLoader(),
              ),
              if (controller.isBottomLoading)
                const SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void setupScrollController(BuildContext context) {
    ref.read(trendingVideosProvider).scrollController.addListener(() async {
      if (ref.read(trendingVideosProvider).scrollController.position.atEdge) {
        if (ref.read(trendingVideosProvider).scrollController.position.pixels !=
            0) {
          if (ref.read(trendingVideosProvider).totalItem >
              ref
                  .read(trendingVideosProvider)
                  .trendingVideoModel!
                  .results!
                  .length) {
            ref.watch(trendingVideosProvider).getTrendingVideos(context);
          }
        }
      }
    });
  }
}
