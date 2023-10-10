import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/pages/game1_level_initial.dart';
import 'package:mi_app_imgsound/src/pages/game1_level_intermediate.dart';
import 'package:mi_app_imgsound/src/pages/game1_level_advanced.dart';
import 'package:mi_app_imgsound/src/pages/game1_level_expert.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:video_player/video_player.dart';

class Level1Screen extends StatefulWidget {
  @override
  _Level1ScreenState createState() => _Level1ScreenState();
}

class _Level1ScreenState extends State<Level1Screen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    // Inicializar el controlador de video aquí
    _videoController = VideoPlayerController.asset('assets/videos/your_video.mp4')
      ..initialize().then((_) {
        // Asegurarse de que el video se repita
        _videoController.setLooping(true);
        // Iniciar la reproducción del video
        _videoController.play();
      });
  }

  @override
  void dispose() {
    // Detener y liberar el controlador de video cuando se dispose la página
    _videoController.pause(); // Pausar el video antes de liberar los recursos
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFF030328),
        leading: IconButton(
          icon: Image.asset('assets/images/icon_atras.png', height: 24, width: 24),
          onPressed: () {
            // Detener la reproducción de video y volver atrás
            _videoController.pause();
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Ritmo Pictórico',
          style: TextStyle(
            color: Color(0xFF044A1D6),
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.bold,
            fontSize: 23.4,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            // Textura de fondo
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/textura_5.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildTextButton('Nivel Inicial', context, Game1LevelInitial()),
                SizedBox(height: 24),
                buildTextButton('Nivel Intermedio', context, Game1LevelIntermediate()),
                SizedBox(height: 24),
                buildTextButton('Nivel Avanzado', context, Game1LevelAdvanced()),
                SizedBox(height: 24),
                buildTextButton('Nivel Experto', context, Game1LevelExpert()),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomFooter(
        currentPageIndex: 5,
        onNotificationDismiss: () {
          // Coloca aquí la lógica para despedir la notificación en esta página específica
          // Puedes establecer el estado de hasWonCoin1 a falso o realizar cualquier otra acción necesaria.
        },
      ),
    );
  }

  Widget buildTextButton(String label, BuildContext context, Widget? page, {bool active = true}) {
    return TextButton(
      onPressed: page == null
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
      child: Text(
        label,
        style: TextStyle(
          color: active ? Color(0xFF044A1D6) : Colors.grey,
          fontFamily: 'WorkSans',
          fontWeight: FontWeight.bold,
          fontSize: 18.7,
        ),
      ),
    );
  }
}
