import 'package:bookshop/main.dart';
import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Datos de Libro"),
        backgroundColor: Colors.grey[700],
      ),
      body: SizedBox.expand(
        child: Container(
          // color: Colors.blue,
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                  image: AssetImage(
                    "assets/images/book-placeholder.png",
                  ),
                  width: MediaQuery.of(context).size.width * .7,
                ),
                Container(
                  // color: Colors.green,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w300,
                                ),
                                "Book Title",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Publish Date",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Pages",
                      ),
                      Text(
                        "Description",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
