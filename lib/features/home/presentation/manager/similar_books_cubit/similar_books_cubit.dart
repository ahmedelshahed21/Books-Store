import 'package:books_store/features/home/data/repos/home_repo.dart';
import 'package:books_store/features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState>{
  final HomeRepo homeRepo;
  SimilarBooksCubit(this.homeRepo):super(SimilarBooksInitial());
  Future<void> fetchSimilarBooks({required String category})async{
    emit(SimilarBooksLoading());
    var result=await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books: books));
    });
  }
}