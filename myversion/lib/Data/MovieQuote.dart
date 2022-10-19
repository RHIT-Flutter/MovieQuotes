class MovieQuote {
  String quote;
  String movie;

  MovieQuote({required this.quote, required this.movie});

  void updateMovieQuote(String newQuote, String newMovie) {
    this.quote = newQuote;
    this.movie = newMovie;
  }
}