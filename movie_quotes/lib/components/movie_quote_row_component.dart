import 'package:flutter/material.dart';

import '../models/movie_quote.dart';

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
