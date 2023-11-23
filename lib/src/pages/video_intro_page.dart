import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:mi_app_imgsound/src/pages/game2_eje3_page.dart';

class VideoIntroPage extends StatefulWidget {
  final int initialHearts;

  VideoIntroPage({required this.initialHearts});

  @override
  _VideoIntroPageState createState() => _VideoIntroPageState();
}

class _VideoIntroPageState extends State<VideoIntroPage> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/videos/precarga_a.mp4')
      ..initialize().then((_) {
        setState(() {});
        Future.delayed(Duration(seconds: 3), () {
          _videoController.play();
        });
      });
    _videoController.addListener(_checkVideo);
  }

  void _checkVideo() {
    if (_videoController.value.position >= _videoController.value.duration) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Game2Eje3Page(initialHearts: widget.initialHearts),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _videoController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: VideoPlayer(_videoController),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
}
