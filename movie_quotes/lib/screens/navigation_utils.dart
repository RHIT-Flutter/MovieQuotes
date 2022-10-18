import 'package:flutter/material.dart';
import 'package:movie_quotes/screens/movie_quote_detail_screen.dart';
import 'package:movie_quotes/screens/movie_quotes_list_screen.dart';

const kRouteMovieQuoteDetail = "movie_quote_detail";

class ScreenArguments {
  final String documentId;

  ScreenArguments({
    this.documentId = "",
  });
}

class NavigationUtils {
  static Future<void> pushScreen({
    required BuildContext context,
    required String name,
    required ScreenArguments screenArguments,
  }) {
    return Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, _, __) => getScreen(name, screenArguments),
          settings: RouteSettings(name: name),
          transitionDuration: Duration(seconds: 0),
        ));
  }

  static StatefulWidget getScreen(
      String name, ScreenArguments screenArguments) {
    switch (name) {
      case kRouteMovieQuoteDetail:
        return MovieQuoteDetailScreen(screenArguments.documentId);
      default:
        print("Unknown screen");
        return MovieQuotesListScreen();
    }
  }
}
