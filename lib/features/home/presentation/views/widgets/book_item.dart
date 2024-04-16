import 'package:books_store/core/utils/app_router.dart';
import 'package:books_store/core/utils/styles.dart';
import 'package:books_store/features/home/data/models/book_model/book_model.dart';
import 'package:books_store/features/home/presentation/views/widgets/book_rating.dart';
import 'package:books_store/features/home/presentation/views/widgets/custom_image_book.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookItem extends StatelessWidget{
  const BookItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(
          AppRouter.kBookDetailsView,
          extra: bookModel
        );
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 2.5 / 4,
                child: CustomImageBook(imageUrl: bookModel.volumeInfo.imageLinks!.thumbnail)
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Text(bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(bookModel.volumeInfo.authors![0],
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Free',
                        style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                      ),
                      BookRating(
                          rating: bookModel.volumeInfo.averageRating??0,
                          count:  bookModel.volumeInfo.ratingsCount??0
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}





