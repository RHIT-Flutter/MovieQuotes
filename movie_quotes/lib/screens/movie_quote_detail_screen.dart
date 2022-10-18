import 'package:flutter/material.dart';

import 'navigation_utils.dart';

class MovieQuoteDetailScreen extends StatefulWidget {
  final String documentId;

  MovieQuoteDetailScreen(this.documentId);

  @override
  State<MovieQuoteDetailScreen> createState() =>
      _MovieQuoteDetailScreenState(documentId);
}

class _MovieQuoteDetailScreenState extends State<MovieQuoteDetailScreen> {
  final String documentId;

  _MovieQuoteDetailScreenState(this.documentId);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie Quote")),
      backgroundColor: Colors.amber,
      body: Center(
        child: const Text("Detail page"),
      ),
    );
  }
}
