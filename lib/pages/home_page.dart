import 'package:bookshop/pages/book_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var _searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Librería Free to Play'),
        backgroundColor: Colors.grey[700],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Container(
          // decoration: BoxDecoration(color: Colors.grey),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                style: TextStyle(color: Colors.grey[700]),
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  label: const Text("Ingresa título"),
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.grey)),
                  labelStyle: TextStyle(color: Colors.grey[700]),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              Divider(),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: 2,
              //     itemBuilder: (BuildContext context, int index) {
              //       return VideoShimmer();
              //     },
              //   ),
              // ),
              Flexible(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 5,
                    crossAxisCount: 2,
                  ),
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BookDetailsPage()));
                      },
                      child: Column(
                        children: [
                          Image(
                              height: 150,
                              image: AssetImage(
                                  "assets/images/book-placeholder.png")),
                          Expanded(
                            child: Text(
                              "Book Title: lorem ipsum lorem ipsum lorem ipsum lorem ipsum ",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
