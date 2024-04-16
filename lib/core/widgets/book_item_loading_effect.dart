import 'package:books_store/core/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class BookItemLoadingEffect extends StatelessWidget {
  const BookItemLoadingEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerEffect(
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 2.5 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: ShimmerEffect(
                        child: Container(
                          height: 15,
                          color: Colors.white24,
                        )
                    ),
                  ),
                  const SizedBox(height: 8),
                  ShimmerEffect(
                      width: double.infinity/2,
                      child: Container(
                        height: 12,
                        color: Colors.white24,
                      )
                  ),
                  const SizedBox(height: 12),
                  ShimmerEffect(
                      child: Container(
                        width: 50,
                        height: 8,
                        color: Colors.white24,
                      )),
                  const SizedBox(height: 8),
                  ShimmerEffect(
                      child: Container(
                        width: 50,
                        height: 8,
                        color: Colors.white24,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
