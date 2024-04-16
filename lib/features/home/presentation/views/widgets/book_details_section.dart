import 'package:books_store/core/utils/styles.dart';
import 'package:books_store/features/home/data/models/book_model/book_model.dart';
import 'package:books_store/features/home/presentation/views/widgets/book_action.dart';
import 'package:books_store/features/home/presentation/views/widgets/book_rating.dart';
import 'package:books_store/features/home/presentation/views/widgets/custom_image_book.dart';
import 'package:flutter/cupertino.dart';

class BookDetailsSection extends StatelessWidget{

  final BookModel book;

  const BookDetailsSection({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.25),
            child: CustomImageBook(
              bookModel: book,
              imageUrl: book.volumeInfo.imageLinks?.thumbnail??'',
            ),
          ),
          const SizedBox(height: 30),
          Text(book.volumeInfo.title!,
            style: Styles.textStyle20.copyWith(
                fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Opacity(
            opacity: 0.7,
            child: Text(book.volumeInfo.authors?[0]??'',
              style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 6),
          BookRating(
            mainAxisAlignmen: MainAxisAlignment.center,
            rating: book.volumeInfo.averageRating??0,
            count: book.volumeInfo.ratingsCount??0,
          ),
          const SizedBox(height: 25),
          BookAction(
            bookModel: book,
          ),
        ],
      ),
    );
  }
}