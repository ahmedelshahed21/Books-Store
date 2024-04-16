import 'package:books_store/core/utils/app_router.dart';
import 'package:books_store/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:books_store/features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import 'package:books_store/features/home/presentation/views/widgets/book_loading_effect.dart';
import 'package:books_store/features/home/presentation/views/widgets/custom_image_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget{
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(
      builder: (BuildContext context, SimilarBooksState state) {
        if(state is SimilarBooksSuccess){
          return  SizedBox(
            height: MediaQuery.of(context).size.height * 0.17,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: (){
                        GoRouter.of(context).push(
                            AppRouter.kBookDetailsView,
                            extra: state.books[index]
                        );
                      },
                      child: CustomImageBook(
                        bookModel: state.books[index],
                        imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail??'',
                      ),
                    ),
                  );
                },
                itemCount: state.books.length
            ),
          );
        }
        else if(state is SimilarBooksFailure){
          return Text('${state.errMessage}');
        }
        else{
          return SizedBox(
              height: MediaQuery.of(context).size.height*0.17,
              child: const BookLoadingEffect());
        }
      },
    );
  }
}