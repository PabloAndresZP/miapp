import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mi_app_imgsound/src/widgets/coin_counter.dart';
import 'package:mi_app_imgsound/src/widgets/hearts_indicator.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:mi_app_imgsound/src/widgets/custom_snackbar_content.dart';
import 'package:mi_app_imgsound/src/pages/game2_page.dart';
import 'package:mi_app_imgsound/src/pages/coin1_game2_page.dart'; 
import 'package:mi_app_imgsound/models/coin_model.dart';
import 'package:provider/provider.dart';

class Game2Eje3Page extends StatefulWidget {
  final int initialHearts;

  Game2Eje3Page({required this.initialHearts});

  @override
  _Game2Eje3PageState createState() => _Game2Eje3PageState();
}

class ProgressCircle extends StatelessWidget {
  final bool isFilled;

  ProgressCircle({required this.isFilled});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: Icon(
        isFilled ? Icons.radio_button_checked : Icons.radio_button_unchecked,
        size: 12.0,
        color: Color(0xFF44A1D6),
      ),
    );
  }
}

class _Game2Eje3PageState extends State<Game2Eje3Page> {
  late AudioPlayer _audioPlayer;
  int selectedAnswer = -1;
  int coins = 0;
  late int hearts;
  int correctAnswer = 1;

  List<String> exerciseImages = [
    'assets/images/persona_miedo.png',
    'assets/images/cisnes.png',
    
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
  final player = AudioPlayer(); // Asegúrate de crear una instancia de AudioPlayer.
  try {
    // Establece la fuente del audio a la URL y luego comienza la reproducción.
    await player.setSource(UrlSource(audioUrl));
    await player.resume(); // La función resume inicia la reproducción del audio.
  } catch (e) {
    // Si hay un error, se captura la excepción y se imprime.
    print("Error al reproducir el audio: $e");
  }
}


  void _checkAnswer() {
  if (selectedAnswer == correctAnswer) {
    CustomSnackbarContent.show(context, '¡Impresionante! Sigues avanzando.', true);
    _playSound('correcto.mp3');

    setState(() {
      coins += 1;
    });

    // Actualización del estado de la moneda en el modelo
    Provider.of<CoinModel>(context, listen: false).winCoin1();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Coin1Game2Page())); 
    });

  } else {
    CustomSnackbarContent.show(context, '¡No te preocupes! Inténtalo de nuevo.', false);
    _playSound('acento.mp3');

    setState(() {
      hearts -= 1;
    });

    if (hearts <= 0) {
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
              width: 252,
              height: 252,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF00D8BB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                      fontWeight: FontWeight.bold,
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

void _playSound(String soundFile) async {
  final player = AudioPlayer(); // Crea una nueva instancia de AudioPlayer
  try {
    // Prepara la fuente del audio usando AssetSource y establece la fuente en el player
    await player.setSource(AssetSource('sounds/$soundFile'));
    await player.resume(); // La función resume inicia la reproducción del audio
  } catch (e) {
    // Si hay un error, se captura la excepción y se imprime.
    print("Error al reproducir el audio: $e");
  }
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
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF030328),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      width: 168.0, // Ajusta el ancho de la barra de progreso aquí
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0), // Establece el radio de borde circular
                        border: Border.all(
                          color: Color(0xFF00D8BB), // Color del borde
                          width: 1.0, // Ancho del borde
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0), // Agrega bordes redondeados al contenido
                        child: LinearProgressIndicator(
                          value: (coins == 1) ? 1.0 : 2 / 3, // Dos de los tres espacios llenos
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
                  'Selecciona la imagen que se asocia con la escala',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFDFDFD),
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 21.5,
                  ),
                ),
                SizedBox(height: 24.0),
              Center(
  child: Container(
    width: 48.0, // Ancho deseado
    height: 48.0, // Alto deseado
    decoration: BoxDecoration(
      shape: BoxShape.circle, // Hace que el contenedor sea circular
      color: Color(0xFF00D8BB),
    ),
    child: IconButton(
      onPressed: () => _playPause(exerciseAudios[0]),
      icon: Icon(Icons.play_arrow, color: Colors.white),
    ),
  ),
),
                SizedBox(height: 12.0),
                Text(
                  'Escala Mayor',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFDFDFD),
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),

                SizedBox(height: 24.0),
                Column(
                  children: exerciseImages.map((imagePath) {
                    int index = exerciseImages.indexOf(imagePath);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAnswer = index;
                        });
                      },
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width - 48.0, 
                          maxHeight: (MediaQuery.of(context).size.width - 48.0) * (9/16), 
                        ),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 24.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: (selectedAnswer == index)
                                  ? Colors.blue
                                  : Colors.transparent,
                              width: 3.0,
                            ),
                            image: DecorationImage(
                              image: AssetImage(exerciseImages[index]),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20.0),


                Container(
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
                
              ],
            ),
          ),
        ),
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