import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
    this.width,
    required this.child,
  });
  final double? width;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor:  Colors.grey[100]!,
          child: child),
    );
  }
}
