import 'package:books_store/core/widgets/custom_button.dart';
import 'package:books_store/features/home/data/models/book_model/book_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget{
  const BookAction({super.key, required this.bookModel});
  final BookModel bookModel;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: ()async{},
              child: r'19.99$',
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: ()async{
                final Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
                if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
                }
              },
              child: 'Preview',
              backgroundColor: const Color(0xFFEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}