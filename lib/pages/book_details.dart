import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class BookDetailsPage extends StatefulWidget {
  final dynamic bookData;
  const BookDetailsPage({
    super.key,
    this.bookData,
  });

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  var showAllLines = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Datos de Libro"),
        backgroundColor: Colors.grey[700],
        actions: [
          IconButton(
              onPressed: () {
                var title = widget.bookData["volumeInfo"]["title"];
                var pageCount = widget.bookData["volumeInfo"]["pageCount"]
                            .toString() !=
                        "null"
                    ? "${widget.bookData["volumeInfo"]["pageCount"]} páginas\n"
                    : "";
                print(widget.bookData["volumeInfo"]["previewLink"]);
                var link =
                    widget.bookData["volumeInfo"]["previewLink"] != "null"
                        ? widget.bookData["volumeInfo"]["previewLink"]
                        : "Enlace no disponible.";
                Share.share(
                    'Mira este libro que encontré:\n$title\n$pageCount\n$link');
              },
              icon: const Icon(Icons.share))
        ],
      ),
      body: SizedBox.expand(
        child: Container(
          // color: Colors.blue,
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  widget.bookData["volumeInfo"]["imageLinks"] != null
                      ? widget.bookData["volumeInfo"]["imageLinks"]["thumbnail"]
                      : "https://biotrop.org/images/default-book.png",
                  width: MediaQuery.of(context).size.width * .7,
                  fit: BoxFit.fill,
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
                                widget.bookData["volumeInfo"]["title"],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        widget.bookData["volumeInfo"]["publishedDate"] ??
                            "No hemos encontrado la fecha de publicación.",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.bookData["volumeInfo"]["pageCount"].toString() !=
                                "null"
                            ? "${widget.bookData["volumeInfo"]["pageCount"]} páginas"
                            : "No hemos encontrado la cantidad de páginas.",
                      ),
                      GestureDetector(
                        onTap: () {
                          showAllLines = !showAllLines;
                          setState(() {});
                        },
                        child: Text(
                          widget.bookData["volumeInfo"]["description"] ??
                              "No hemos encontrado la descripcion.",
                          style: const TextStyle(fontStyle: FontStyle.italic),
                          maxLines: showAllLines ? 100 : 6,
                          overflow: TextOverflow.ellipsis,
                        ),
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
