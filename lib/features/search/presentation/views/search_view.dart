import 'package:books_store/features/search/presentation/manager/search_cubit.dart';
import 'package:books_store/features/search/presentation/views/widgets/custom_search_text_filed.dart';
import 'package:books_store/features/search/presentation/views/widgets/empty_search.dart';
import 'package:books_store/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<SearchCubit>(context);
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
              ),
            ),
            title: CustomSearchTextFiled(
              onChanged: (value) {
                bloc.search(value: value);
              },
              controller: bloc.searchController,
            ),
            centerTitle: true,
          ),
          body: bloc.searchController.text.isEmpty
              ? const NoSearchItem()
              : SearchViewBody(
            bookModel: bloc.books!,
          ),
        );
      },
    );
  }
}
