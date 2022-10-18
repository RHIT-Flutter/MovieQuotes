import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_quotes/models/firebase_constants.dart';
import 'package:movie_quotes/models/movie_quote.dart';

class MovieQuotesCollectionManager {
  List<DocumentSnapshot> lastDocumentSnapshots = [];
  late CollectionReference primaryRef;

  MovieQuotesCollectionManager._privateConstructor() {
    primaryRef =
        FirebaseFirestore.instance.collection(kMovieQuotesCollectionPath);
  }
  static final MovieQuotesCollectionManager instance =
      MovieQuotesCollectionManager._privateConstructor();

  void add({required String quote, required String movie}) {
    primaryRef
        .add({
          kMovieQuoteQuote: quote,
          kMovieQuoteMovie: movie,
          kMovieQuoteLastTouched: FieldValue.serverTimestamp(),
        })
        .then((docRef) => docRef.id)
        .catchError((error) {
          print("Failed to add thread: $error");
          return "";
        });
  }

  void startListening(Function observer) {
    primaryRef
        .orderBy(kMovieQuoteLastTouched, descending: true)
        .snapshots()
        .listen((QuerySnapshot querySnapshot) {
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
      .map((doc) => MovieQuote(
          quote: doc.get(kMovieQuoteQuote), movie: doc.get(kMovieQuoteMovie)))
      .toList();
}
