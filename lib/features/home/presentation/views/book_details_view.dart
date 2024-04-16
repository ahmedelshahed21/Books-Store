import 'package:books_store/features/home/data/models/book_model/book_model.dart';
import 'package:books_store/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:books_store/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BookDetailsView extends StatefulWidget{

  final BookModel bookModel;

  const BookDetailsView({super.key, required this.bookModel});
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      category: widget.bookModel.volumeInfo.categories![0]
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            SizedBox(width: 20),
            CloseButton(color: Colors.white70),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.shopping_cart),
          ),
          const SizedBox(width: 40),
        ],
      ),
      body: Column(
        children: [
          BookDetailsViewBody(bookModel: widget.bookModel)
        ],
      ),
    );
  }
}