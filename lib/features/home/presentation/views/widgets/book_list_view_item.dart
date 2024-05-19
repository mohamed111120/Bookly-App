import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: book );
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookItem(image: book.image ?? '',),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.height * .25,
                    child: Text(
                      book.title??'',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGTSectraFine,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    book.authorName??'',
                    style: Styles.textStyle14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,

                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${book.price.toString()} \$',
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      BookRating(rating: book.rating.toString() ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

