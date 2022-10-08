import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc() : super(BooksInitial()) {
    on<SearchBooksEvent>(_searchBooks);
  }

  Future<FutureOr<void>> _searchBooks(
      SearchBooksEvent event, Emitter emit) async {
    // When clicking search emit LoadingState() which shows shimmer
    emit(LoadingState());

    // Do http request
    Uri url = Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=${event.bookToSearch}");

    try {
      var response = await http.get(url);
      var body = jsonDecode(response.body);

      if (body["totalItems"] == 0) {
        // If response has no books, emit NoResultsState
        emit(NoResultsState());
      } else {
        // If response has results, emit ShowResultsState (send books array)
        emit(ShowResultsState(books: body["items"]));
      }
    } catch (e) {
      // If request or response reading fails, emit ErrorState
      emit(ErrorState());
    }
  }
}
