//Modèle pour les critiques
// the same
class Review {
  final String userName; // Nom de l'utilisateur ayant laissé la critique
  final double rating;   // Note donnée par l'utilisateur (par exemple, sur 10)
  final String comment;
  final String title;
  final String backDropPath;
  final String posterPath;  // Commentaire de l'utilisateur

  Review({
    required this.userName,
    required this.rating,
    required this.comment,
    required this.title,
    required this.backDropPath,
    required this.posterPath
  });

  // Convertir un objet Review en format JSON
  Map <String,dynamic> toMap(){
    return {
      'userName': userName,
      'rating': rating,
      'comment': comment,
       'title':title,
      'backDropPath': backDropPath,
      'posterPath':posterPath
    };
  }

  // Créer un objet Review à partir d'un format JSON
  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      userName: map['userName'],
      rating: map['rating'],
      comment: map['comment'],
      title: map['title'],
      backDropPath: map['backdrop_path'],
      posterPath: map['poster_path']);
    
  }
}
