import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mi_app_imgsound/src/widgets/coin_counter.dart';
import 'package:mi_app_imgsound/src/widgets/hearts_indicator.dart';

class Game2Page extends StatefulWidget {
  @override
  _Game2PageState createState() => _Game2PageState();
}

class _Game2PageState extends State<Game2Page> {
  late AudioPlayer _audioPlayer1, _audioPlayer2;
  bool isPlaying1 = false;
  bool isPlaying2 = false;
  int selectedAnswer = -1;
  int completedExercises = 0;
  int coins = 0;
  int hearts = 3;

  @override
  void initState() {
    super.initState();
    _audioPlayer1 = AudioPlayer();
    _audioPlayer2 = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer1.dispose();
    _audioPlayer2.dispose();
    super.dispose();
  }

  void _playPause(String audioUrl, int playerNumber) {
    // Aquí va tu código para manejar la reproducción de audio.
  }

  void _checkAnswer() {
    // Aquí va tu lógica de verificar respuestas.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/icon_atras.png'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Pintando sonido',
          style: TextStyle(
            color: Color(0xFFFDFDFD),
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.bold,
            fontSize: 21.5,
          ),
        ),
        backgroundColor: Color(0xFF030328),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/textura_3.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CoinCounter(coins),
                    Row(
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.0),
                          child: Icon(
                            index < completedExercises ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                            size: 12.0,
                          ),
                        ),
                      ),
                    ),
                    HeartsIndicator(hearts),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  'Selecciona la escala que se asocia con la imagen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFDFDFD),
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 21.5,
                  ),
                ),
                Image.asset('assets/images/bosquet.png'),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => _playPause('assets/audios/escmayor.mp3', 1),
                          child: Icon(isPlaying1 ? Icons.pause : Icons.play_arrow, color: Colors.white),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00D8BB)),
                          ),
                        ),
                        Radio(
                          value: 0,
                          groupValue: selectedAnswer,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer = value as int;
                            });
                          },
                        ),
                        Text(
                          'Escala Mayor',
                          style: TextStyle(
                            color: Color(0xFFFDFDFD),
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 21.5,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => _playPause('assets/audios/escmenor.mp3', 2),
                          child: Icon(isPlaying2 ? Icons.pause : Icons.play_arrow, color: Colors.white),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00D8BB)),
                          ),
                        ),
                        Radio(
                          value: 1,
                          groupValue: selectedAnswer,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer = value as int;
                            });
                          },
                        ),
                        Text(
                          'Escala Menor',
                          style: TextStyle(
                            color: Color(0xFFFDFDFD),
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 21.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _checkAnswer,
                  child: Text(
                    'Comprobar',
                    style: TextStyle(
                      color: Color(0xFFFDFDFD),
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 21.5,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00D8BB)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}