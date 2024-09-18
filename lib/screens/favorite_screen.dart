//Liste des films favoris
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../widgets/movie_cart.dart';

class PageFavories extends StatelessWidget {
  const PageFavories({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoris'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 2 / 3,
        ),
        itemCount: movieProvider.favoriteMovies.length,
        itemBuilder: (context, index) {
          return MovieCard(movie: movieProvider.favoriteMovies[index]);
        },
      ),
    );
  }
}

