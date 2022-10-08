import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookshop/repositories/books_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc() : super(BooksInitial()) {
    on<SearchBooksEvent>(_searchBooks);
  }

  Future<FutureOr<void>> _searchBooks(
      SearchBooksEvent event, Emitter emit) async {
    dynamic booksList;

    // When clicking search emit LoadingState() which shows shimmer
    emit(LoadingState());

    try {
      booksList = await BooksRepository().getBooks(event.bookToSearch);

      if (booksList["totalItems"] == 0) {
        // If response has no books, emit NoResultsState
        emit(NoResultsState());
      } else {
        // If response has results, emit ShowResultsState (send books array)
        emit(ShowResultsState(books: booksList["items"]));
      }
    } catch (e) {
      // If request or response fails, emit ErrorState
      emit(ErrorState());
    }
  }
}
