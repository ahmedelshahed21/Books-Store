import 'package:books_store/features/home/data/models/book_model/book_model.dart';

class SimilarBooksState {
  const SimilarBooksState();
}

class SimilarBooksInitial extends SimilarBooksState{}
class SimilarBooksLoading extends SimilarBooksState{}

class SimilarBooksSuccess extends SimilarBooksState{
  final List<BookModel> books;
  SimilarBooksSuccess({required this.books});
}
class SimilarBooksFailure extends SimilarBooksState{
  final String? errMessage;
  SimilarBooksFailure(this.errMessage);
}

