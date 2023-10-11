import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/widgets/coin_counter.dart';
import 'package:mi_app_imgsound/src/widgets/hearts_indicator.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';

class Game1LevelAdvanced extends StatefulWidget {
  @override
  _Game1LevelAdvancedState createState() => _Game1LevelAdvancedState();
}

class _Game1LevelAdvancedState extends State<Game1LevelAdvanced> {
  int coins = 1;
  int hearts = 3;
  int completedExercises = 2;
  int totalExercises = 3;
  late AudioPlayer audioPlayer;
  late VideoPlayerController _videoController1;
  late VideoPlayerController _videoController2;

 @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    _videoController1 = VideoPlayerController.asset('assets/videos/nivel_avanzado_01.mp4')
      ..initialize().then((_) {
        _videoController1.setLooping(true);
        _videoController1.play(); // Agrega esta línea
        setState(() {});
      });
    _videoController2 = VideoPlayerController.asset('assets/videos/nivel_avanzado_02.mp4')
      ..initialize().then((_) {
        _videoController2.setLooping(true);
        _videoController2.play(); // Agrega esta línea
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
          'Nivel Avanzado RP',
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
                        'Elige la animación que coincide con el audio',
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
                    Center(
                      child: Container(
                        width: 48.0, // Ancho deseado
                        height: 48.0, // Alto deseado
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // Hace que el contenedor sea circular
                          color: Color(0xFF00D8BB),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            await audioPlayer.play('assets/sounds/ritmo nivel avanzado.mp3', isLocal: true);
                          },
                          icon: Icon(Icons.play_arrow, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    _videoController1.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _videoController1.value.aspectRatio,
                            child: VideoPlayer(_videoController1),
                          )
                        : Container(),
                    SizedBox(height: 20.0),
                    _videoController2.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _videoController2.value.aspectRatio,
                            child: VideoPlayer(_videoController2),
                            

                          )
                        : Container(),
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
    _videoController1.dispose();
    _videoController2.dispose();
    audioPlayer.dispose();
    super.dispose();
  }
}
