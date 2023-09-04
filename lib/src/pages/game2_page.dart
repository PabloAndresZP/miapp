import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mi_app_imgsound/src/widgets/coin_counter.dart';
import 'package:mi_app_imgsound/src/widgets/hearts_indicator.dart';
import 'package:mi_app_imgsound/src/pages/game2_eje3_page.dart';

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

   List<int> correctAnswers = [1, 0]; 

  int currentExerciseIndex = 0;
  List<String> exerciseImages = [
    'assets/images/bosquet.png',
    'assets/images/personam.png',
    // ... otras imágenes ...
  ];
  List<String> exerciseAudios1 = [
    'assets/sounds/escmayor.mp3',
    'assets/sounds/esccromatica.mp3',
    
    // ... otros audios ...
  ];
  List<String> exerciseAudios2 = [
    'assets/sounds/escmenor.mp3',
    'assets/sounds/modofrigio.mp3',
    // ... otros audios ...
  ];

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

  void _playPause(String audioUrl, int playerNumber) async {
  AudioPlayer currentPlayer = (playerNumber == 1) ? _audioPlayer1 : _audioPlayer2;
  AudioPlayer otherPlayer = (playerNumber == 1) ? _audioPlayer2 : _audioPlayer1;
  bool currentPlaying = (playerNumber == 1) ? isPlaying1 : isPlaying2;

  if (currentPlaying) {
    await currentPlayer.pause();
  } else {
    await otherPlayer.stop(); // Detener el otro audio.
    int result = await currentPlayer.play(audioUrl); 
    if (result != 1) {
      print("Error al reproducir el audio");
    }
  }

  setState(() {
    if (playerNumber == 1) {
      isPlaying1 = !isPlaying1;
      isPlaying2 = false;
    } else {
      isPlaying2 = !isPlaying2;
      isPlaying1 = false;
    }
  });
}

  void _goToNextExercise() {
    if (currentExerciseIndex < exerciseImages.length - 1) {
      setState(() {
        currentExerciseIndex += 1;
        selectedAnswer = -1;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('¡Has completado todos los ejercicios!'),
        duration: Duration(seconds: 2),
      ));
    }
  }

void _checkAnswer() {
  if (selectedAnswer == correctAnswers[currentExerciseIndex]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('¡Bien!'),
      duration: Duration(seconds: 3),
    ));

    setState(() {
      completedExercises += 1;
      coins += 10; 
    });

    if (completedExercises == correctAnswers.length) { 
      Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => Game2Eje3Page(initialHearts: hearts)),
);

    } else {
      _goToNextExercise();
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Incorrecto'),
      duration: Duration(seconds: 2),
    ));

    setState(() {
      hearts -= 1;
    });

    if (hearts <= 0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Juego Terminado'),
          content: Text('Has perdido todos tus corazones. ¿Quieres intentarlo de nuevo?'),
          actions: [
            TextButton(
              child: Text('Sí'),
              onPressed: () {
                Navigator.of(context).pop();
                // Aquí puedes resetear cualquier variable si es necesario para reiniciar el juego.
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
                // Puedes hacer cualquier otra acción necesaria si el jugador decide no intentarlo de nuevo.
              },
            ),
          ],
        ),
      );
    }
  }
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
                Image.asset(exerciseImages[currentExerciseIndex]),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => _playPause(exerciseAudios1[currentExerciseIndex], 1),
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
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => _playPause(exerciseAudios2[currentExerciseIndex], 2),
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
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: _checkAnswer,
                  child: Text('Verificar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}