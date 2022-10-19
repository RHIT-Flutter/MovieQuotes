import 'package:flutter/material.dart';
import 'package:myversion/Data/MovieQuote.dart';

class MovieQuoteWidget extends StatelessWidget {
  MovieQuote mq;
  final Function() onTap;

  MovieQuoteWidget({required this.mq, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(mq.quote),
      subtitle: Text(mq.movie),
      trailing: Icon(Icons.chevron_right_rounded),
    );
  }
}