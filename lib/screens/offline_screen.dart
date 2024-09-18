// Écran affiché en mode hors ligne
import 'package:flutter/material.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mode Hors Ligne'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_off, size: 100, color: Colors.grey),
            const SizedBox(height: 20),
            const Text(
              'Vous êtes hors ligne',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Veuillez vérifier votre connexion Internet.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logique pour essayer de se reconnecter ou accéder aux films locaux
              },
              child: const Text('Réessayer'),
            ),
          ],
        ),
      ),
    );
  }
}
