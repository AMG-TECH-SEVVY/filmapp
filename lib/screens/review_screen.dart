//Écran pour laisser des critiques
import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../widgets/review_cart.dart';

class ReviewScreen extends StatelessWidget {
  final Movie movie;

  const ReviewScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Critiques pour ${movie.title}'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: movie.reviews.length,
        itemBuilder: (context, index) {
          final review = movie.reviews[index];
          return ReviewCard(review: review);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logique pour ajouter une nouvelle critique
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
