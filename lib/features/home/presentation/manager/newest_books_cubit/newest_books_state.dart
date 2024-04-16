

import 'package:books_store/features/home/data/models/book_model/book_model.dart';

class NewestBooksState {
  const NewestBooksState();
}

class NewestBooksInitial extends NewestBooksState{}
class NewestBooksLoading extends NewestBooksState{}

class NewestBooksSuccess extends NewestBooksState{
  final List<BookModel> books;
  NewestBooksSuccess({required this.books});
}
class NewestBooksFailure extends NewestBooksState{
  final String? errMessage;
  NewestBooksFailure(this.errMessage);
}

