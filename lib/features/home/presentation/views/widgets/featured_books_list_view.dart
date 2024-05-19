import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  FeaturedBooksListViewState createState() => FeaturedBooksListViewState();
}

class FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late ScrollController _scrollController;
  var nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter /
            _scrollController.position.maxScrollExtent <=
        0.3) {
      if (!isLoading) {
        isLoading = true;
        fetchFeaturedBooks();
        isLoading = false;
      }
    }
  }

  void fetchFeaturedBooks() {
    BlocProvider.of<FeaturedBooksCubit>(context)
        .fetchFeaturedBooks(pageNumber: nextPage++);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.29,
      child: ListView.builder(
        controller: _scrollController,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 8),
            child: CustomBookItem(image: widget.books[index].image ?? ''),
          );
        },
      ),
    );
  }
}
