import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myversion/Data/MovieQuote.dart';
import 'package:myversion/Layout/EditRowWidget.dart';
import 'package:myversion/Layout/MovieQuoteWidget.dart';
import 'package:myversion/firebase_options.dart';

class EditPage extends StatelessWidget {

  const EditPage({super.key, required this.passedMovieQuote});

  final MovieQuote passedMovieQuote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Movie Quote'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new EditRowWidget(labelText: 'Quote: ', fieldText: passedMovieQuote.quote),
          new EditRowWidget(labelText: 'Movie', fieldText: passedMovieQuote.movie),
          ElevatedButton(onPressed: (){}, child: Text("Save changes"))
        ],
      ),
    );
  }
}