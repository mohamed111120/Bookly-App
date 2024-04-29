import 'package:flutter/material.dart';

import 'featured_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {

  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*.29,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 8),
            child: FeaturedBookItem(),
          );
        },
      ),
    );
  }
}
