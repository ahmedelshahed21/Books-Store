import 'package:books_store/core/utils/app_router.dart';
import 'package:books_store/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:books_store/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:books_store/features/home/presentation/views/widgets/book_loading_effect.dart';
import 'package:books_store/features/home/presentation/views/widgets/custom_image_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedItemsListView extends StatelessWidget{
  const FeaturedItemsListView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
     builder: (context, state) {
       if (state is FeaturedBooksSuccess){
         return SizedBox(
           height: MediaQuery.of(context).size.height*0.25,
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
       else if(state is FeaturedBooksFailure){
         return Text(state.errMessage.toString());
       }
       else {
         return SizedBox(
             height: MediaQuery.of(context).size.height*0.25,
             child: const BookLoadingEffect());
       }
      },
    );
  }
}