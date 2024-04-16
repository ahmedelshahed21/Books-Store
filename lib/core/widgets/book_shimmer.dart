import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookShimmer extends StatelessWidget {
  const BookShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor:Colors.grey[100]!,
      child: AspectRatio(
        aspectRatio: 2.5 / 4,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white24
          ),
        ),
      ),
    );
  }
}
