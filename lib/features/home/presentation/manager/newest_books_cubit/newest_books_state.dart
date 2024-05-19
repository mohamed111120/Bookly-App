part of 'newest_books_cubit.dart';

@immutable
sealed class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}


final class NewestBooksLoadingState extends NewestBooksState {}
final class NewestBooksPaginationLoadingState extends NewestBooksState {}

final class NewestBooksSuccessState extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccessState(this.books);
}

final class NewestBooksFailureState extends NewestBooksState {
  final String errMessage;

  NewestBooksFailureState(this.errMessage);
}
