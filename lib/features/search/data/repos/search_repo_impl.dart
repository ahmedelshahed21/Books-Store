import 'package:books_store/core/errors/failure.dart';
import 'package:books_store/core/utils/api_service.dart';
import 'package:books_store/features/home/data/models/book_model/book_model.dart';
import 'package:books_store/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService api;
 const SearchRepoImpl(this.api);
  @override
  Future<Either<Failure, BookModel>> searchBook({required String searchItem}) async {
    try {
      var data = await api.get(
          endPoint: 'volumes',
          queryParameters: {'q': 'subject:$searchItem',
           'Filtering':'ebooks',});
      BookModel book = BookModel.fromJson(data);
      return right(book);
    } on DioException catch (e) {
      return left(ServerFailure(errMessage: e.message!));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
