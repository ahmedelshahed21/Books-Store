import 'package:books_store/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key,this.mainAxisAlignmen=MainAxisAlignment.start, required this.rating, required this.count});
  final MainAxisAlignment mainAxisAlignmen;
  final num rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignmen,
      children: [
        const Icon(Icons.star,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(width: 6.3),
        Text('${rating??0}',
          style: Styles.textStyle14,
        ),
        const SizedBox(width: 5.0),
        Opacity(
          opacity: 0.5,
          child: Text('(${count??0})',
              style: Styles.textStyle14
          ),
        ),
      ],
    );
  }
}