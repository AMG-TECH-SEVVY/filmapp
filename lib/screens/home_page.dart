import 'package:filmapp/screens/favorite_screen.dart';
import 'package:filmapp/screens/profile.dart';
import 'package:filmapp/screens/watchlist_screen.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("les films de vos besoins"),
        leading: const Icon(Icons.menu),
        centerTitle: true,
        actions: const [
          Icon(Icons.search_rounded),
          SizedBox(width: 20),
          Icon(Icons.notifications),
          SizedBox(width: 10),
        
        ],
      ),
     
      body: Stack(
        children: [       
          // Contenu principal
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Liste de films sous forme de grille
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Nombre de colonnes
                      crossAxisSpacing: 10.0, // Espacement horizontal entre les éléments
                      mainAxisSpacing: 10.0, // Espacement vertical entre les éléments
                      childAspectRatio: 0.6, // Ajuste ce ratio pour modifier la taille des éléments
                    ),
                    itemCount: 102, // Remplace par le nombre réel de films
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white.withOpacity(0.8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.movie, size: 50),
                            const SizedBox(height: 8),
                            Text('Film $index', // Remplace par le titre réel du film
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            const Text('Description courte', // Remplace par une description réelle
                                textAlign: TextAlign.center),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Champ de recherche près du bouton rechercher
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Rechercher un film...',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Logique de recherche
                      },
                      child: const Text('Rechercher'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Boutons de navigation
                ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PageFavories()),
                  );
                },
                child: const Text('Favoris'),
              ),
                const SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WatchLaterPage()),
                  );
                },
                child: const Text('Regarder plus tard'),
              ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                  );
                },
                child: const Text('Profil'),
              ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
