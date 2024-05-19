part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoadingState extends FeaturedBooksState {}
final class FeaturedBooksPaginationLoadingState extends FeaturedBooksState {}

final class FeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccessState(this.books);
}

final class FeaturedBooksFailureState extends FeaturedBooksState {
  final String errMessage;

  FeaturedBooksFailureState(this.errMessage);
}
