import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/book_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: BookListViewItem(
              book: BookEntity(
                  bookId: '1',
                  image: '',
                  title: 'test',
                  authorName: 'test',
                  price: 1,
                  rating: 1),
            ),
          );
        },
      ),
    );
  }
}
