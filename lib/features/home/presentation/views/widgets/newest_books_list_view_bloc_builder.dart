import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'newest_books_list_view.dart';

class NewestBooksListViewBlocBuilder extends StatefulWidget {
  const NewestBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<NewestBooksListViewBlocBuilder> createState() => _NewestBooksListViewBlocBuilderState();
}

class _NewestBooksListViewBlocBuilderState extends State<NewestBooksListViewBlocBuilder> {

  List<BookEntity> books=[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccessState){
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccessState || state is NewestBooksPaginationLoadingState) {
          return NewestBooksListView(books: books,);
        } else if (state is NewestBooksFailureState) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
