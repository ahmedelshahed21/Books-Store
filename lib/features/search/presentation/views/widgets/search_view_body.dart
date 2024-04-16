import 'package:books_store/features/home/data/models/book_model/book_model.dart';
import 'package:books_store/features/home/presentation/views/widgets/book_item.dart';
import 'package:books_store/features/search/presentation/manager/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget{
  final BookModel? bookModel;
  const SearchViewBody({super.key,required this.bookModel});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
        builder: (context,state){
          if (state is SearchLoadingState) {
            return ListView.builder(
              itemBuilder: (context, index) => const CircularProgressIndicator(),
              itemCount: 20,
            );
          } else if (state is SearchErrorState) {
            return Center(
              child: Text(state.errorMassage),
            );
          } else {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Text(
                    'Search Results',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),

                ListView.builder(
                  itemBuilder: (context, index) => BookItem(
                    bookModel: bookModel!,
                  ),
                  itemCount: 1
                ),
              ],
            );
          }

        }
    );

  }


}

