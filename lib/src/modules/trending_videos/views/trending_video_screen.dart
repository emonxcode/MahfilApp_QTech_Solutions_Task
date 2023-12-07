import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mahfil_app/src/utils/app_colors.dart';
import 'package:mahfil_app/src/utils/context.dart';
import 'package:mahfil_app/src/utils/sizes.dart';
import 'package:mahfil_app/src/widgets/app_text_widget.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../widgets/shimmer_loader.dart';
import '../controllers/trending_videos_provider.dart';

class TrendingVideosScreen extends ConsumerStatefulWidget {
  const TrendingVideosScreen({super.key});

  @override
  ConsumerState<TrendingVideosScreen> createState() => _TrendingVideosState();
}

class _TrendingVideosState extends ConsumerState<TrendingVideosScreen> {
  bool isDataLoaded = false;
  final scrollController = ScrollController();

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
                            controller: scrollController,
                            physics: const BouncingScrollPhysics(),
                            itemCount:
                                controller.trendingVideoModel!.results!.length,
                            itemBuilder: (context, index) {
                              var video = controller
                                  .trendingVideoModel!.results![index];
                              return Container(
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
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Container(),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          right: 10,
                                          child: Container(
                                            height: 25,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.network(
                                                  video.channelImage!),
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
                              );
                            },
                          )
                        : const Center(
                            child: Text("No videos"),
                          )
                    : const ShimmerLoader(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
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
