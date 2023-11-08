import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/widgets/coin_counter.dart';
import 'package:mi_app_imgsound/src/widgets/hearts_indicator.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';

class Game1LevelIntermediate extends StatefulWidget {
  @override
  _Game1LevelIntermediateState createState() => _Game1LevelIntermediateState();
}

class _Game1LevelIntermediateState extends State<Game1LevelIntermediate> {
  int coins = 0;
  int hearts = 2;
  int completedExercises = 2;
  int totalExercises = 3; // Cambia el número total de ejercicios aquí
  late AudioPlayer audioPlayer;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    _videoController = VideoPlayerController.asset('assets/videos/nivel_intermedio.mp4')
      ..initialize().then((_) {
        _videoController.setLooping(true);
        _videoController.play(); // Agrega esta línea
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030328),
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          icon: Image.asset('assets/images/icon_atras.png'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Nivel Intermedio RP',
          style: TextStyle(
            color: Color(0xFF44A1D6),
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.bold,
            fontSize: 23.4,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF030328),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CoinCounter(coins),
                        Container(
                          height: 8.0,
                          width: 168.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: LinearProgressIndicator(
                              value: completedExercises / totalExercises,
                              backgroundColor: Color(0xFF0A0A53),
                              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00D8BB)),
                            ),
                          ),
                        ),
                        HeartsIndicator(hearts),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Center(
                      child: Text(
                        'Sincroniza la siguiente animación con el audio',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFFDFDFD),
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 21.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    _videoController.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _videoController.value.aspectRatio,
                            child: VideoPlayer(_videoController),
                          )
                        : Container(),
                    SizedBox(height: 20.0),
                    Image.asset('assets/images/componente_rp.png'),
                    SizedBox(height: 20.0),
                    Center(
                      child: Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF00D8BB),
                        ),
                        child: IconButton(
                          onPressed: () async {
  try {
    // Configura el origen del audio para reproducir desde los assets
    await audioPlayer.setSource(AssetSource('sounds/ritmo nivel intermedio.mp3'));
    // Inicia la reproducción
    await audioPlayer.resume();
  } catch (e) {
    // Manejo de errores si algo falla
    print('Error al reproducir el audio: $e');
  }
},

                          icon: Icon(Icons.play_arrow, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Verificar',
                          style: TextStyle(
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.7,
                            color: Color(0xFFFDFDFD),
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF00D8BB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomFooter(
        currentPageIndex: 5,
        onNotificationDismiss: () {},
      ),
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }
}
