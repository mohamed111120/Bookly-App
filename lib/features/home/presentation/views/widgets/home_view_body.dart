import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_list_view_item.dart';
import 'newest_books_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';
import 'featured_books_list_view_bloc_builder.dart';
import 'newest_books_list_view_bloc_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key});

  @override
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final ScrollController _scrollController = ScrollController();
  var nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
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
        isLoading =true;
        fetchNewestBooks();
        isLoading=false;
      }
    }
  }

  void fetchNewestBooks() {
    BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(
      pageNumber: nextPage++
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        controller: _scrollController,
        clipBehavior: Clip.none,
        slivers: const [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBarr(),
                SizedBox(
                  height: 16,
                ),
                FeaturedBooksListViewBlocBuilder(),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'newest books',
                  style: Styles.textStyle18,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: NewestBooksListViewBlocBuilder(),
          ),
        ],
      ),
    );
  }
}
