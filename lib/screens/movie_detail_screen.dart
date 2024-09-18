//Détails d'un film
import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(movie.description),
            const SizedBox(height: 20),
            Text('Genre: ${movie.genres}'),
            Text('Rating: ${movie.rating}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ajouter aux favoris ou à la watchlist
              },
              child: const Text('Ajouter aux Favoris'),
            ),
          ],
        ),
      ),
    );
  }
}
