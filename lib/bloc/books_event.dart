part of 'books_bloc.dart';

abstract class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object> get props => [];
}

class SearchBooksEvent extends BooksEvent {
  final String bookToSearch;

  const SearchBooksEvent({required this.bookToSearch});

  @override
  List<Object> get props => [bookToSearch];
}
