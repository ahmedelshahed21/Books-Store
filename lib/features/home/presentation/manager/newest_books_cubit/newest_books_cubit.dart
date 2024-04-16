
import 'package:books_store/features/home/data/repos/home_repo.dart';
import 'package:books_store/features/home/presentation/manager/newest_books_cubit/newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState>{
  final HomeRepo homeRepo;
  NewestBooksCubit(this.homeRepo):super(NewestBooksInitial());
  Future<void> fetchNewestBooks()async{
    emit(NewestBooksLoading());
    var result=await homeRepo.fetchNewestBooks();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewestBooksSuccess(books: books));
    });
  }
}