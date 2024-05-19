import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/booksAction.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'book_details_section.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book, });
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child:  Column(
          children: [
            const CustomBookDetailsAppBar(),
            BookDetailsSection(book: book,),
            const Expanded(
              child: SizedBox(
                height: 50,
              ),
            ),
            const SimilarBooksSection(),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      )
      ],
    );
  }
}


