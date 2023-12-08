import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mahfil_app/src/utils/context.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ImageCachedWithShimmerLoader extends StatelessWidget {
  const ImageCachedWithShimmerLoader({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  final String imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) => Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Shimmer(
            duration: const Duration(seconds: 3), //Default value
            interval: const Duration(
                seconds: 5), //Default value: Duration(seconds: 0)
            color: Colors.black, //Default value
            colorOpacity: 0.1, //Default value
            enabled: true, //Default value
            direction: const ShimmerDirection.fromLTRB(), //Default Value
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 200,
              width: context.width,
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
