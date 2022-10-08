part of 'books_bloc.dart';

@immutable
abstract class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

class BooksInitial extends BooksState {}

class LoadingState extends BooksState {}

class ShowResultsState extends BooksState {
  final List<dynamic> books;

  const ShowResultsState({required this.books});
  @override
  List<Object> get props => [books];
}

class NoResultsState extends BooksState {}

class ErrorState extends BooksState {}
