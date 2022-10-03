import 'dart:html';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Librería Free to Play'),
        backgroundColor: Colors.grey[700],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(color: Colors.grey),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
