import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/movie_quote.dart';

class MovieQuotesCollectionManager {
  List<DocumentSnapshot> lastDocumentSnapshots = [];

  // TODO: Figure out a more elegant solution to this silly right hand side.
  CollectionReference primaryRef =
      FirebaseFirestore.instance.collection("FlutterMovieQuotes");

  MovieQuotesCollectionManager._privateConstructor() {
    primaryRef = FirebaseFirestore.instance.collection("FlutterMovieQuotes");
  }
  static final MovieQuotesCollectionManager instance =
      MovieQuotesCollectionManager._privateConstructor();

  void add(String quote, String movie) {
    primaryRef.add({"quote": quote, "movie": movie});
  }

  void startListening(Function observer) {
    print("Start listening");
    primaryRef.snapshots().listen((QuerySnapshot querySnapshot) {
      // saveLastDocumentSnapshots(querySnapshot);
      lastDocumentSnapshots = querySnapshot.docs;
      observer();
      for (var doc in querySnapshot.docs) {
        print(doc.data());
      }
    }, onError: (error) {
      print("Error listening $error");
    });
  }

  List<MovieQuote> get values => lastDocumentSnapshots
      .map(
          (doc) => MovieQuote(quote: doc.get("quote"), movie: doc.get("movie")))
      .toList();
}
