import 'package:flutter/material.dart';
import 'package:movie_quotes/managers/movie_quote_document_manager.dart';
import 'package:movie_quotes/managers/movie_quotes_collection_manager.dart';
import 'package:movie_quotes/models/movie_quote.dart';

class DialogUtils {
  static Future<void> showMovieQuoteDialog(
      {required BuildContext context, MovieQuote? mqToEdit}) async {
    TextEditingController _quoteTextFieldController = TextEditingController();
    TextEditingController _movieTextFieldController = TextEditingController();

    String title = 'Create a quote';
    if (mqToEdit != null) {
      title = "Edit this quote";
      _quoteTextFieldController.text = mqToEdit.quote;
      _movieTextFieldController.text = mqToEdit.movie;
    }
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {},
                  controller: _quoteTextFieldController,
                  decoration: InputDecoration(hintText: "Quote"),
                ),
                TextField(
                  onChanged: (value) {},
                  controller: _movieTextFieldController,
                  decoration: InputDecoration(hintText: "Movie"),
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  if (mqToEdit != null) {
                    MovieQuoteDocumentManager.instance.update(
                        quote: _quoteTextFieldController.text,
                        movie: _movieTextFieldController.text);
                  } else {
                    MovieQuotesCollectionManager.instance.add(
                        quote: _quoteTextFieldController.text,
                        movie: _movieTextFieldController.text);
                  }
                  _quoteTextFieldController.text = "";
                  _movieTextFieldController.text = "";
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
