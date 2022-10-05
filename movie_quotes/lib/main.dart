import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MovieQuote {
  final String quote;
  final String movie;

  MovieQuote({required this.quote, required this.movie});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Quotes',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Movie Quotes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MovieQuote> quotes = [];

  @override
  Widget build(BuildContext context) {
    quotes.add(MovieQuote(quote: "I'll be back", movie: "The Terminator"));
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: quotes
            .map((mq) => MovieQuoteRowComponent(mq, (String docId) {
                  print("You pressed the row!");
                }))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Create a quote',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MovieQuoteRowComponent extends StatelessWidget {
  final MovieQuote moviequote;
  final Function(String) onTap;

  MovieQuoteRowComponent(
    this.moviequote,
    this.onTap,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(moviequote.quote),
      subtitle: Text(moviequote.movie),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}