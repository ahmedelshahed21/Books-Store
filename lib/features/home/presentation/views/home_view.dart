import 'package:books_store/core/utils/app_router.dart';
import 'package:books_store/core/utils/assets_app.dart';
import 'package:books_store/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget{
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AssetsAPP.logo,
          height: 20,
        ),
        actions: [
          IconButton(
              onPressed: (){
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              icon: const Icon(Icons.search,
                color: Colors.white,
                size: 28,
              )
          )
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}