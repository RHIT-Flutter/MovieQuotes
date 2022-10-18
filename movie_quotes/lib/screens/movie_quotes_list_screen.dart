import 'package:flutter/material.dart';

import '../components/movie_quote_row_component.dart';
import '../managers/movie_quotes_collection_manager.dart';

class MovieQuotesListScreen extends StatefulWidget {
  const MovieQuotesListScreen({super.key, required this.title});

  final String title;

  @override
  State<MovieQuotesListScreen> createState() => MovieQuotesListScreenState();
}

class MovieQuotesListScreenState extends State<MovieQuotesListScreen> {
  // List<MovieQuote> quotes = []; // Done first then replace by Firestore

  TextEditingController _quoteTextFieldController = TextEditingController();
  TextEditingController _movieTextFieldController = TextEditingController();

  Future<void> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Create a quote'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: _quoteTextFieldController,
                  decoration: InputDecoration(hintText: "Quote"),
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: _movieTextFieldController,
                  decoration: InputDecoration(hintText: "Movie"),
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    MovieQuotesCollectionManager.instance.add(
                        _quoteTextFieldController.text,
                        _movieTextFieldController.text);
                    // quotes.add(MovieQuote(
                    //     quote: _quoteTextFieldController.text,
                    //     movie: _movieTextFieldController.text));
                    _quoteTextFieldController.text = "";
                    _movieTextFieldController.text = "";
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    //quotes.add(MovieQuote(quote: "I'll be back", movie: "The Terminator"));
    MovieQuotesCollectionManager.instance.startListening(() {
      print("I got called back!");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: getMovieQuoteComponents(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _displayDialog(context);
        },
        tooltip: 'Create a quote',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<MovieQuoteRowComponent> getMovieQuoteComponents() {
    return MovieQuotesCollectionManager.instance.values
        .map((mq) => MovieQuoteRowComponent(mq, (String docId) {
              print("TODO: Handle a click on a row.");
            }))
        .toList();
  }
}
