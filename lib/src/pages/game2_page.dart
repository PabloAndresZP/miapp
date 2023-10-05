import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mi_app_imgsound/src/widgets/coin_counter.dart';
import 'package:mi_app_imgsound/src/widgets/hearts_indicator.dart';
import 'package:mi_app_imgsound/src/pages/game2_eje3_page.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:mi_app_imgsound/src/widgets/custom_snackbar_content.dart';

class Game2Page extends StatefulWidget {
  @override
  _Game2PageState createState() => _Game2PageState();
}

class _Game2PageState extends State<Game2Page> {
  bool _showOverlay = false; // Declarar aquí la variable _showOverlay

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
    'assets/images/parejaa.png',
  ];
  List<String> exerciseAudios1 = [
    'assets/sounds/escmayor.mp3',
    'assets/sounds/escmayor.mp3',
  ];
  List<String> exerciseAudios2 = [
    'assets/sounds/escmenor.mp3',
    'assets/sounds/escmenor.mp3',
  ];

  // Lista para manejar las etiquetas debajo de los círculos
  List<List<String>> labels = [
    ['Escala Mayor', 'Escala Menor'],
    ['Escala Mayor', 'Escala Menor']
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

  void _showSnackBarWithOverlay(String message, bool isCorrect) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    );

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.black.withOpacity(0.5), // Fondo oscurecido
      builder: (BuildContext context) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ModalBarrier(
              color: Colors.black.withOpacity(0.5), // Fondo oscurecido
              dismissible: false,
            ),
            snackBar, // Mostrar el SnackBar original
            Positioned(
              bottom: 20, // Ajusta la posición vertical según tus necesidades
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                child: Text(
                  'Cerrar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _checkAnswer() {
    if (selectedAnswer == correctAnswers[currentExerciseIndex]) {
      CustomSnackbarContent.show(context, "¡Perfecto! Continúa así.", true);
      _playSound('correcto.mp3');

      setState(() {
        completedExercises += 1;
        if (completedExercises % 3 == 0) {
          coins += 1;
          _showOverlay = true; // Mostrar el fondo oscurecido
        }
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
      CustomSnackbarContent.show(context, "¡Eso estuvo cerca! Prueba una vez más.", false);
      _playSound('acento.mp3');

      setState(() {
        hearts -= 1;
        _showOverlay = true; // Mostrar el fondo oscurecido
      });

      if (hearts <= 0) {
        // Llama a esta función donde necesites mostrar el cuadro de diálogo
        Future.delayed(Duration(seconds: 2), () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              insetPadding: EdgeInsets.all(0),
              contentPadding: EdgeInsets.all(0),
              titlePadding: EdgeInsets.all(16),
              actionsPadding: EdgeInsets.all(8),
              buttonPadding: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              content: Container(
                width: 312,
                height: 312,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF00D8BB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/animo.png', width: 80, height: 80), // Imagen para ¡Ánimo!
                    Text(
                      '¡Ánimo!',
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.7,
                        color: Color(0xFFFDFDFD),
                      ),
                    ),
                    Text(
                      'Aunque se han agotado tus corazones, sabemos que puedes hacerlo mejor.',
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFFFDFDFD),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '¿Te gustaría intentarlo de nuevo?',
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFDFDFD),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          child: Text(
                            'Sí',
                            style: TextStyle(
                              fontFamily: 'WorkSans',
                              fontSize: 18.7,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFDFDFD),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            _showOverlay = false; // Restaurar el fondo normal
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => Game2Page()));
                          },
                        ),
                        TextButton(
                          child: Text(
                            'No',
                            style: TextStyle(
                              fontFamily: 'WorkSans',
                              fontSize: 18.7,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFDFDFD),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
      }
    }
  }

  _playSound(String soundFile) async {
    final player = AudioCache(prefix: 'sounds/');
    player.play(soundFile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF060630),
      appBar: AppBar( toolbarHeight: 80,
        leading: IconButton(
          icon: Image.asset('assets/images/icon_atras.png'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Pintando sonido',
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
                          height: 8.0, // Ajusta la altura de la barra de progreso aquí
                          width: 200.0, // Ajusta el ancho de la barra de progreso aquí
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0), // Establece el radio de borde circular
                            border: Border.all(
                              color: Colors.transparent, // Establece el color del borde como transparente cuando la barra está vacía
                              width: 1.0, // Ancho del borde
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0), // Agrega bordes redondeados al contenido
                            child: LinearProgressIndicator(
                              value: completedExercises / 3, // Cambia 3 al número total de ejercicios
                              backgroundColor: Color(0xFF0A0A53), // Establece el fondo de la barra de progreso
                              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00D8BB)), // Establece el color de la barra de progreso
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
                            InkWell(
                              onTap: () => _playPause(exerciseAudios1[currentExerciseIndex], 1),
                              child: ClipOval(
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  color: Color(0xFF00D8BB),
                                  child: Icon(isPlaying1 ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 30),
                                ),
                              ),
                            ),
                            Radio(
                              value: 0,
                              groupValue: selectedAnswer,
                              activeColor: Color(0xFF44A1D6),
                              onChanged: (value) {
                                setState(() {
                                  selectedAnswer = value as int;
                                });
                              },
                            ),
                            Text(labels[currentExerciseIndex][0], style: TextStyle(color: Colors.white))
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () => _playPause(exerciseAudios2[currentExerciseIndex], 2),
                              child: ClipOval(
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  color: Color(0xFF00D8BB),
                                  child: Icon(isPlaying2 ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 30),
                                ),
                              ),
                            ),
                            Radio(
                              value: 1,
                              groupValue: selectedAnswer,
                              activeColor: Color(0xFF44A1D6),
                              onChanged: (value) {
                                setState(() {
                                  selectedAnswer = value as int;
                                });
                              },
                            ),
                            Text(labels[currentExerciseIndex][1], style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_showOverlay)
            Container(
              color: Colors.black.withOpacity(0.5), // Fondo oscurecido
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Container(
              height: 60.0,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _checkAnswer,
                child: Text(
                  'Verificar',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.7,
                    color: Color(0xFFFDFDFD),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF00D8BB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
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
}


