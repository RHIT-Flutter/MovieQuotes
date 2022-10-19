import 'package:flutter/material.dart';
import 'package:movie_quotes/components/dialog_utils.dart';
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
      appBar: AppBar(
        title: Text("Movie Quote"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit this quote',
            onPressed: () {
              DialogUtils.showMovieQuoteDialog(
                context: context,
                mqToEdit: mq,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete this quote',
            onPressed: () async {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Quote Deleted')));
              await MovieQuoteDocumentManager.instance.remove();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      backgroundColor: Colors.amber,
      // body: Center(
      //   child: Text("$quote from $movie"),
      // ),

      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.movie),
                title: Text(quote),
                subtitle: Text(movie),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
