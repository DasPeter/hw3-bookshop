import 'package:flutter/material.dart';

import '../pages/book_details.dart';

class OneBookGridWidget extends StatelessWidget {
  final dynamic bookData;
  const OneBookGridWidget({super.key, this.bookData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BookDetailsPage(bookData: bookData)));
      },
      child: Column(
        children: [
          // height: 150,
          Image.network(
              bookData["volumeInfo"]["imageLinks"] != null
                  ? bookData["volumeInfo"]["imageLinks"]["thumbnail"]
                  : "https://biotrop.org/images/default-book.png",
              height: 150),
          Expanded(
            child: Text(
              "${bookData["volumeInfo"]["title"]}",
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
