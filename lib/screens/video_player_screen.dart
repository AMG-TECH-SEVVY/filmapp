import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Initialiser le contrôleur de vidéo avec l'URL de la vidéo
    _controller = VideoPlayerController.network(widget.videoUrl);
    // Initialiser la vidéo
    _initializeVideoPlayerFuture = _controller.initialize();
    // Boucler la vidéo
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Libérer les ressources utilisées par le contrôleur vidéo
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lecture Vidéo'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Afficher le lecteur vidéo lorsque l'initialisation est terminée
            return Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                // Afficher le bouton de lecture/pause
                if (!_controller.value.isPlaying)
                  IconButton(
                    icon: Icon(Icons.play_circle_outline, size: 64, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        _controller.play();
                      });
                    },
                  ),
              ],
            );
          } else {
            // Afficher un indicateur de chargement pendant l'initialisation
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // Basculer entre lecture et pause
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
