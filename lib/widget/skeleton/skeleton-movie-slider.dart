import 'package:flutter/material.dart';

class SkeletonMovieSlide extends StatelessWidget {
  final double? width, height;
  const SkeletonMovieSlide({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.06),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}
