import 'dart:convert';

import 'package:http/http.dart' as http;

class BooksRepository {
  static final BooksRepository bookRepository = BooksRepository._internal();
  factory BooksRepository() => bookRepository;

  BooksRepository._internal();

  Future<dynamic> getBooks(String bookToSearch) async {
    // Do http request
    Uri url = Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=$bookToSearch");

    var response = await http.get(url);
    var body = jsonDecode(response.body);

    return body;
  }
}
