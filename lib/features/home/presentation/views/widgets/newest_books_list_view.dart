import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'book_list_view_item.dart';
class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key, required this.books});
 final List<BookEntity> books ;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return  Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: BookListViewItem(book: books[index],),
        );
      },
    );
  }
}
