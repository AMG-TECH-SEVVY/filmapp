//Modèle pour un film
import 'review.dart'; 

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final double rating;
  final List<String> genres;
  final List<Review> reviews;
  final String backDropPath;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.rating,
    required this.genres,
    required this.reviews,
    required this.backDropPath,
  });

  String get description => overview;

  factory Movie.fromMap(Map<String, dynamic> map){
    var genreList = (map['genre_ids'] as List<dynamic>?)?.map((genreId) => genreId.toString()).toList() ?? [];
    var reviewList = (map['reviews'] as List<dynamic>?)?.map((reviewJson) => Review.fromMap(reviewJson)).toList() ?? [];

    return Movie(
      id: map['id'],
      title: map['title'],
      overview: map['overview'] ?? '',
      posterPath: map['poster_path'] ?? '',
      releaseDate: map['release_date'] ?? '',
      rating: (map['vote_average'] as num?)?.toDouble() ?? 0.0,
      genres: genreList,
      reviews: reviewList,
      backDropPath: map['backdrop_path'],
    );
  }

  // Méthode toJson pour convertir l'objet en JSON
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'vote_average': rating,
      'genre_ids': genres,
      'reviews': reviews.map((review) => review.toMap()).toList(),
      'backDropPath':backDropPath,
    };
  }

  String get imageUrl {
    const String baseUrl = 'https://api.themoviedb.org/3/person/{person_id}/images';
    return '$baseUrl$posterPath';
  }
}
