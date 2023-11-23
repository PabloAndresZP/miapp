import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:mi_app_imgsound/src/pages/game2_page.dart'; // Importamos Game2Page

class Video2IntroPage extends StatefulWidget {
  @override
  _Video2IntroPageState createState() => _Video2IntroPageState();
}

class _Video2IntroPageState extends State<Video2IntroPage> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/videos/precarga_v.mp4')
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _videoController.play(); // Reproducir inmediatamente después de inicializar
          });
        }
      });
    _videoController.addListener(_checkVideo);
  }

  void _checkVideo() {
    if (_videoController.value.position >= _videoController.value.duration) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Game2Page(), // Navegación a Game2Page
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030328), // Establecer el color de fondo aquí
      body: _videoController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: VideoPlayer(_videoController),
            )
          : SizedBox.shrink(), // No mostrar nada antes de que el video esté listo
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
}
