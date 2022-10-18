import 'package:flutter/material.dart';
import 'package:movie_quotes/managers/movie_quote_document_manager.dart';
import 'package:movie_quotes/models/movie_quote.dart';

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
    MovieQuoteDocumentManager.instance.startListeningFor(documentId, () {
      print("Informed the model object changed.");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    MovieQuote mq = MovieQuoteDocumentManager.instance.value();
    String quote = mq.quote;
    String movie = mq.movie;

    return Scaffold(
      appBar: AppBar(title: Text("Movie Quote")),
      backgroundColor: Colors.amber,
      body: Center(
        child: Text("$quote from $movie"),
      ),
    );
  }
}
