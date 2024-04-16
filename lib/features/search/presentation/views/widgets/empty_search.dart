import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
class NoSearchItem extends StatelessWidget {
  const NoSearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Search Your Book',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
