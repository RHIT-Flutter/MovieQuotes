import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_quotes/models/firebase_constants.dart';
import 'package:movie_quotes/models/firestore_model_utils.dart';

class MovieQuote {
  late String quote;
  late String movie;
  late String documentId;

  MovieQuote({required this.quote, required this.movie});

  MovieQuote.from(DocumentSnapshot documentSnapshot) {
    quote =
        FirestoreModelUtils.getStringField(documentSnapshot, kMovieQuoteQuote);
    movie =
        FirestoreModelUtils.getStringField(documentSnapshot, kMovieQuoteMovie);
    documentId = documentSnapshot.id;
  }
}
