import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mi_app_imgsound/src/widgets/coin_counter.dart';
import 'package:mi_app_imgsound/src/widgets/hearts_indicator.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';

class Game2Eje3Page extends StatefulWidget {
  final int initialHearts;

  Game2Eje3Page({required this.initialHearts});

  @override
  _Game2Eje3PageState createState() => _Game2Eje3PageState();
}

class _Game2Eje3PageState extends State<Game2Eje3Page> {
  late AudioPlayer _audioPlayer;
  int selectedAnswer = -1;
  int coins = 0;
  late int hearts;
  int correctAnswer = 1;  // Suponiendo que la segunda imagen es la correcta

  List<String> exerciseImages = [
    'assets/images/bosquet.png',
    'assets/images/personam.png',
  ];

  List<String> exerciseAudios = [
    'assets/sounds/escmayor.mp3',
  ];

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    hearts = widget.initialHearts;
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPause(String audioUrl) async {
    int result = await _audioPlayer.play(audioUrl);
    if (result != 1) {
      print("Error al reproducir el audio");
    }
  }

  void _checkAnswer() {
    if (selectedAnswer == correctAnswer) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('¡Bien!'),
        duration: Duration(seconds: 3),
      ));

      setState(() {
        coins += 10; 
      });

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
                },
              ),
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
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
              image: AssetImage('assets/images/textura_6.png'),
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
                    HeartsIndicator(hearts),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  'Selecciona la imagen que se asocia con el audio',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFDFDFD),
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 21.5,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: exerciseImages.map((imagePath) {
                    int index = exerciseImages.indexOf(imagePath);
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedAnswer = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: (selectedAnswer == index)
                                  ? Colors.blue
                                  : Colors.transparent,
                              width: 3.0,
                            ),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(imagePath, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: () => _playPause(exerciseAudios[0]),
                  child: Icon(Icons.play_arrow, color: Colors.white),
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
      bottomNavigationBar: CustomFooter(),  // Aquí se añade el footer.
    );
  }
}