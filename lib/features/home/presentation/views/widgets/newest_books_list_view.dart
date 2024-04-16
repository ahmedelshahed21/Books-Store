import 'package:books_store/core/widgets/book_item_loading_effect.dart';
import 'package:books_store/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:books_store/features/home/presentation/manager/newest_books_cubit/newest_books_state.dart';
import 'package:books_store/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget{
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
   return Expanded(
     child: Padding(
       padding: const EdgeInsets.symmetric(vertical: 10.0),
       child: BlocBuilder<NewestBooksCubit,NewestBooksState>(
           builder: (context, state){
             if(state is NewestBooksSuccess){
               return ListView.builder(
                 padding: EdgeInsets.zero,
                 physics: const NeverScrollableScrollPhysics(),
                 itemCount: state.books.length,
                 itemBuilder: (context,index){
                   return Padding(
                     padding: const EdgeInsets.only(left: 20.0,bottom: 20.0,right: 8.0),
                     child: BookItem(bookModel: state.books[index]),
                   );
                 },
               );
             }
             else if(state is NewestBooksFailure){
               return Text(state.errMessage.toString());
             }
             else{
               return ListView.builder(
                   itemCount: 10,
                   itemBuilder: (context,index){
                     return const Padding(
                       padding: EdgeInsets.only(left: 20.0,bottom: 20.0,right: 8.0),
                       child: BookItemLoadingEffect(),
                     );
                   }
               );
             }
           }
         )
      ),
    );
  }
}