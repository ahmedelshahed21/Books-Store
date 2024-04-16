import 'package:books_store/core/utils/styles.dart';
import 'package:books_store/features/home/presentation/views/widgets/featured_items_list_view.dart';
import 'package:books_store/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget{
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              FeaturedItemsListView(),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child:Expanded(child: NewestBooksListView()),
        )
      ],
    );
  }
}