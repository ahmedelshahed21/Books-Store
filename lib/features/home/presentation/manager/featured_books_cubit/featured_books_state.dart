

import 'package:books_store/features/home/data/models/book_model/book_model.dart';

class FeaturedBooksState{
  const FeaturedBooksState();
}



class FeaturedBooksLoading extends FeaturedBooksState{}

class FeaturedBooksInitial extends FeaturedBooksState{}

class FeaturedBooksSuccess extends FeaturedBooksState{

  final List<BookModel> books;
  FeaturedBooksSuccess({required this.books});
}
class FeaturedBooksFailure extends FeaturedBooksState{
  final String? errMessage;
  FeaturedBooksFailure({required this.errMessage});
}