import 'package:bookshop/bloc/books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

import '../widgets/one_book_grid_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Librería Free to Play'),
        backgroundColor: Colors.grey[700],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              style: TextStyle(color: Colors.grey[700]),
              cursorColor: Colors.grey,
              onSubmitted: (value) {
                BlocProvider.of<BooksBloc>(context)
                    .add(SearchBooksEvent(bookToSearch: searchController.text));
              },
              decoration: InputDecoration(
                label: const Text("Ingresa título"),
                suffixIcon: IconButton(
                    onPressed: () {
                      BlocProvider.of<BooksBloc>(context).add(SearchBooksEvent(
                          bookToSearch: searchController.text));
                    },
                    icon: const Icon(Icons.search, color: Colors.grey)),
                labelStyle: TextStyle(color: Colors.grey[700]),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            const Divider(),
            Expanded(child: BlocBuilder<BooksBloc, BooksState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return const VideoShimmer();
                    },
                  );
                } else if (state is ShowResultsState) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5,
                      crossAxisCount: 2,
                    ),
                    itemCount: state.books.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OneBookGridWidget(bookData: state.books[index]);
                    },
                  );
                } else if (state is NoResultsState) {
                  return const Center(
                    child: Text("No encontramos resultados a tu búsqueda."),
                  );
                } else if (state is ErrorState) {
                  return const Center(
                    child:
                        Text("Ha habido un error. Por favor intenta de nuevo."),
                  );
                } else {
                  return const Center(
                    child: Text("Inicia una búsqueda arriba"),
                  );
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
