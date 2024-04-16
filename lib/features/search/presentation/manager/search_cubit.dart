import 'package:bloc/bloc.dart';
import 'package:books_store/core/errors/failure.dart';
import 'package:books_store/features/home/data/models/book_model/book_model.dart';
import 'package:books_store/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  TextEditingController searchController = TextEditingController();
  BookModel? books;
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  Future<void> searchBook() async {
    emit(SearchLoadingState());
    Either<Failure, BookModel> data =
        await searchRepo.searchBook(searchItem: searchController.text);
    data.fold((fail) {
      emit(SearchErrorState(errorMassage: fail.errMessage.toString()));
    }, (book) {
      books = book;
      emit(SearchSuccessState());
    });
  }

  void search({required String value}) {
    searchController.text = value;
    searchBook();
    emit(ChangeSearch());
  }
}
