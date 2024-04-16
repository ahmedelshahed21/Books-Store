import 'package:books_store/core/widgets/book_shimmer.dart';
import 'package:books_store/features/home/data/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageBook extends StatelessWidget{
  const CustomImageBook({super.key, required this.imageUrl,this.bookModel});
  final String imageUrl;
  final BookModel? bookModel;

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 2.5 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            placeholder: (context, url) => const BookShimmer(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),


    );
  }
}


