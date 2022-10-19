import 'package:flutter/material.dart';
import 'package:movie_quotes/components/dialog_utils.dart';
import 'package:movie_quotes/screens/movie_quote_detail_screen.dart';
import 'package:movie_quotes/screens/navigation_utils.dart';

import '../components/movie_quote_row_component.dart';
import '../managers/movie_quotes_collection_manager.dart';

class MovieQuotesListScreen extends StatefulWidget {
  @override
  State<MovieQuotesListScreen> createState() => _MovieQuotesListScreenState();
}

class _MovieQuotesListScreenState extends State<MovieQuotesListScreen> {
  // List<MovieQuote> quotes = []; // Done first then replace by Firestore

  @override
  void initState() {
    super.initState();
    //quotes.add(MovieQuote(quote: "I'll be back", movie: "The Terminator"));
    MovieQuotesCollectionManager.instance.startListening(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Quotes"),
      ),
      body: ListView(
        children: getMovieQuoteComponents(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("You pressed the FAB");
          DialogUtils.showMovieQuoteDialog(context: context);
        },
        tooltip: 'Create a quote',
        child: const Icon(Icons.add),
      ),
    );
  }

  List<MovieQuoteRowComponent> getMovieQuoteComponents() {
    return MovieQuotesCollectionManager.instance.values
        .map((mq) => MovieQuoteRowComponent(mq, (String docId) {
              print("Show detail screen for $docId");
              NavigationUtils.pushScreen(
                  context: context,
                  name: kRouteMovieQuoteDetail,
                  screenArguments: ScreenArguments(documentId: docId));
            }))
        .toList();
  }
}
