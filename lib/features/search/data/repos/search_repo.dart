import 'package:books_store/core/errors/failure.dart';
import 'package:books_store/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
   Future<Either<Failure, BookModel>> searchBook({required String searchItem});
}
