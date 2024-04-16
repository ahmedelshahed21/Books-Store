import 'package:books_store/features/home/data/models/book_model/book_model.dart';
import 'package:books_store/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';

class SearchResultsListView extends StatelessWidget {
  final BookModel book;
  const SearchResultsListView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child:BookItem(bookModel: book)
            //BookItem(),
          );
        },

      ),
    );
  }
}