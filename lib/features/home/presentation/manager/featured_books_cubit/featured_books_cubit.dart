
import 'package:books_store/features/home/data/repos/home_repo.dart';
import 'package:books_store/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState>{
  FeaturedBooksCubit(this.homeRepo):super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks()async{
    emit(FeaturedBooksLoading());
      var result=await homeRepo.fetchFeaturedBooks();
      result.fold((failure) {
        emit(FeaturedBooksFailure(errMessage: failure.errMessage));
      }, (books) {
        emit(FeaturedBooksSuccess(books: books));
      });
  }
}