import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mi_app_imgsound/src/widgets/coin_counter.dart';
import 'package:mi_app_imgsound/src/widgets/hearts_indicator.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:mi_app_imgsound/src/widgets/custom_snackbar_content.dart';

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
    // ... (mismo código)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      appBar: AppBar(
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
                    Row(
                      children: [
                        ProgressCircle(isFilled: true), 
                        ProgressCircle(isFilled: true), 
                        ProgressCircle(isFilled: coins > 0), 
                      ],
                    ),
                    HeartsIndicator(hearts),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  'Selecciona la imagen que se asocia con la escala',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF030328),
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 21.5,
                  ),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () => _playPause(exerciseAudios[0]),
                  child: Icon(Icons.play_arrow, color: Colors.white),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00D8BB)),
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
      bottomNavigationBar: CustomFooter(), // Tu footer aquí
    );
  }
}