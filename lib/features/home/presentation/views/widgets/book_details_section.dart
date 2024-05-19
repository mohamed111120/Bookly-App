import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'booksAction.dart';
import 'custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book, });
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .305,
          child:  CustomBookItem(image: book.image ?? '',),
        ),
        const SizedBox(
          height: 24,
        ),
         Text(
           textAlign: TextAlign.center,
          book.title ?? '',
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            textAlign: TextAlign.center,
            book.authorName ?? '',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
         BookRating(rating: book.rating.toString(),),
        const SizedBox(
          height: 30,
        ),
        const BooksAction(),
      ],
    );
  }
}
