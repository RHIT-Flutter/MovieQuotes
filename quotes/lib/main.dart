import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MovieQuote {
  final String quote;
  final String movie;

  MovieQuote(this.quote, this.movie);
}

class _MyHomePageState extends State<MyHomePage> {
  String quoteTemp = '';
  String movieTemp = '';
  List<MovieQuote> _quotes = [];

  void clear() {
    setState(() {
      quoteTemp = '';
      movieTemp = '';
    });
  }

  void delete(int index) {
    setState(() {
      _quotes.removeAt(index);
    });
  }

  bool addQuote() {
    bool fullFields = quoteTemp != '' && movieTemp != '';
    setState(() {
      if (fullFields) {
        _quotes.add(MovieQuote(quoteTemp, movieTemp));
      }
      clear();
    });
    return fullFields;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      // ListView widget handles displaying the quotes and movie names

      body: ListView.builder(
        itemCount: _quotes.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '"${_quotes[index].quote}"',
                        textAlign: TextAlign.center,
                        style: const TextStyle(height: 2, fontSize: 25),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Text('From: ${_quotes[index].movie}',
                              style: TextStyle(
                                  height: 1,
                                  fontSize: 20,
                                  color: Colors.grey[700])),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => delete(index),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                  highlightColor: Colors.red,
                  hoverColor: Colors.grey[200],
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) =>

              // AlertDialog is used to create the pop-up for the quote entries

              AlertDialog(
            title: const Text('Enter your quote'),
            content: SizedBox(
              height: 130,
              child: Column(
                children: [
                  TextField(
                    onChanged: (String value) {
                      quoteTemp = value;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Quote',
                    ),
                  ),
                  const Spacer(),
                  TextField(
                    onChanged: (String value) {
                      movieTemp = value;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Movie',
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  clear();
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (!addQuote()) {
                    final snackBar = SnackBar(
                      content: const Text('you must enter a movie and a quote'),
                      backgroundColor: (Colors.black54),
                      action: SnackBarAction(
                        label: 'dismiss',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        tooltip: 'add quote',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
