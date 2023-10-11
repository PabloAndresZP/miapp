import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/widgets/coin_counter.dart';
import 'package:mi_app_imgsound/src/widgets/hearts_indicator.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:audioplayers/audioplayers.dart';

class Game1LevelInitial extends StatefulWidget {
  @override
  _Game1LevelInitialState createState() => _Game1LevelInitialState();
}

class _Game1LevelInitialState extends State<Game1LevelInitial> {
  int coins = 0;
  int hearts = 3;
  int completedExercises = 1;
  int totalExercises = 3; // Cambia el número total de ejercicios aquí
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
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
          'Nivel Inicial RP',
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
                    Image.asset('assets/images/nivel_1_rp.png'),
                    SizedBox(height: 20.0),
                    Image.asset('assets/images/componente_rp.png'),
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
                            await audioPlayer.play('assets/sounds/ritmo nivel inicial 3.mp3', isLocal: true);
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
        onNotificationDismiss: () {
          // Coloca aquí la lógica para despedir la notificación en esta página específica
          // Puedes establecer el estado de hasWonCoin1 a falso o realizar cualquier otra acción necesaria.
        },
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
