import 'package:books_store/constants.dart';
import 'package:books_store/core/utils/app_router.dart';
import 'package:books_store/core/utils/service_locator.dart';
import 'package:books_store/features/home/data/repos/home_repo_impl.dart';
import 'package:books_store/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:books_store/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:books_store/features/search/data/repos/search_repo_impl.dart';
import 'package:books_store/features/search/presentation/manager/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())..fetchFeaturedBooks()
        ),
        BlocProvider(
            create: (context) => NewestBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewestBooks()
        ),
        BlocProvider(
            create: (context) => SearchCubit(getIt.get<SearchRepoImpl>())..searchBook()
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: kPrimaryColor
          ),
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }


}

