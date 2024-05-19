import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_newest_boo_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.newestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase newestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if(pageNumber == 0) {
      emit(NewestBooksLoadingState());
    }else{
      emit(NewestBooksPaginationLoadingState());
    }

    var result = await newestBooksUseCase.call(pageNumber);

    result.fold(
          (failure) {
        emit(NewestBooksFailureState(failure.message));
      },
          (books) {
        emit(NewestBooksSuccessState(books));
      },
    );
  }
}
