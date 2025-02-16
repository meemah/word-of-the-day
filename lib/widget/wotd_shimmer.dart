import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class WotdShimmer extends StatelessWidget {
  final double height;
  final double width;
  final BoxShape shapeBorder;
  const WotdShimmer.rectangular({
    super.key,
    required this.height,
    required this.width,
  }) : shapeBorder = BoxShape.rectangle;
  const WotdShimmer.circular({
    super.key,
    required this.height,
    required this.width,
  }) : shapeBorder = BoxShape.circle;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      enabled: true,
      color: Colors.black,
      child: Container(
        decoration: BoxDecoration(shape: shapeBorder),
        height: height,
        width: width,
      ),
    );
  }
}
