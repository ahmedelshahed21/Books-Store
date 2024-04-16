import 'package:books_store/features/home/data/models/book_model/book_model.dart';
import 'package:books_store/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:books_store/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/cupertino.dart';

class BookDetailsViewBody extends StatelessWidget{

  final BookModel bookModel;

  const BookDetailsViewBody({super.key, required this.bookModel});


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.55,
          child: BookDetailsSection(
            book: bookModel,
          ),
        ),
        const SizedBox(height: 50),
        SizedBox(
            height: MediaQuery.of(context).size.height*0.25,
            child: const SimilarBooksSection(),
        ),
      ],
    );
  }
}