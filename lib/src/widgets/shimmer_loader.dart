import 'package:flutter/material.dart';
import 'package:mahfil_app/src/utils/context.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        height: 200,
        width: context.width,
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
    );
  }
}
