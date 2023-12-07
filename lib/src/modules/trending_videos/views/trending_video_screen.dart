import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
                            itemCount: controller.trendingVideoModel!.total!,
                            itemBuilder: (context, index) {
                              return Container(
                                child: const Text("data"),
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
}
