//Fournisseur pour la gestion des films
import 'package:flutter/material.dart';
import 'package:filmapp/models/movie.dart';

class MovieProvider extends ChangeNotifier {
  // Liste de tous les films
  List<Movie> _movies = [];
  
  // Liste des films à regarder plus tard
  List<Movie> _watchlistMovies = [];

  // Liste des films favoris
  List<Movie> _favoriteMovies = [];

  // Getters
  List<Movie> get movies => _movies;
  List<Movie> get watchlistMovies => _watchlistMovies;
  List<Movie> get favoriteMovies => _favoriteMovies;

  // Méthodes pour gérer la watchlist
  void addToWatchlist(Movie movie) {
    _watchlistMovies.add(movie);
    notifyListeners();
  }

  void removeFromWatchlist(Movie movie) {
    _watchlistMovies.remove(movie);
    notifyListeners();
  }

  // Méthodes pour gérer les favoris
  void addToFavorites(Movie movie) {
    if (!_favoriteMovies.contains(movie)) {
      _favoriteMovies.add(movie);
      notifyListeners();
    }
  }

  void removeFromFavorites(Movie movie) {
    if (_favoriteMovies.contains(movie)) {
      _favoriteMovies.remove(movie);
      notifyListeners();
    }
  }

  // Setter pour mettre à jour la liste des films
  void setMovies(List<Movie> movies) {
    _movies = movies;
    notifyListeners();
  }
}
