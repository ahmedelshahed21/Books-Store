import 'package:books_store/core/widgets/book_shimmer.dart';
import 'package:flutter/material.dart';

class BookLoadingEffect extends StatelessWidget {
  const BookLoadingEffect({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: BookShimmer(),
        ),
        itemCount: 10
    );
  }
}
