import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myversion/Data/MovieQuote.dart';
import 'package:myversion/Layout/EditPage.dart';
import 'package:myversion/Layout/MovieQuoteWidget.dart';
import 'package:myversion/firebase_options.dart';

class ListPage extends StatefulWidget {

  const ListPage({super.key});

  @override _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<MovieQuote> movieQuotes = [];

  @override
  void initState() {
    super.initState();
    movieQuotes = [];
    movieQuotes.add((MovieQuote(quote: "Screw you guys, I'm going home", movie: "South Park Movie")));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: ListView.builder(
        itemCount: movieQuotes.length,
        itemBuilder: (context, index) {
          return MovieQuoteWidget(mq: movieQuotes[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditPage(passedMovieQuote: movieQuotes[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,//TODO: PUT ADD MOVIEQUOTE ACTION HERE ,
        tooltip: 'Add MovieQuote',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
