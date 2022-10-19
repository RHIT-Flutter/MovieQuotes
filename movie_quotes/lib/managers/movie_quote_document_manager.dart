import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_quotes/models/firebase_constants.dart';
import 'package:movie_quotes/models/movie_quote.dart';

class MovieQuoteDocumentManager {
  DocumentSnapshot? lastDocumentSnapshot;
  late CollectionReference primaryRef;

  MovieQuoteDocumentManager._privateConstructor() {
    primaryRef =
        FirebaseFirestore.instance.collection(kMovieQuotesCollectionPath);
  }
  static final MovieQuoteDocumentManager instance =
      MovieQuoteDocumentManager._privateConstructor();

  void startListeningFor(String documentId, Function observer) {
    primaryRef.doc(documentId).snapshots().listen(
        (DocumentSnapshot documentSnapshot) {
      lastDocumentSnapshot = documentSnapshot;
      observer();
    }, onError: (error) {
      print("Error listening $error");
    });
  }

  void update({required String quote, required String movie}) {
    primaryRef.doc(lastDocumentSnapshot?.id).update({
      kMovieQuoteQuote: quote,
      kMovieQuoteMovie: movie,
      kMovieQuoteLastTouched: FieldValue.serverTimestamp(),
    }).catchError((error) {
      print("Failed to update quote: $error");
    });
  }

  // NOTE: We expect the caller to nuke the listeners and observers.
  Future<void>? remove() {
    return lastDocumentSnapshot?.reference.delete();
  }

  MovieQuote value() => MovieQuote.from(lastDocumentSnapshot!);
}
