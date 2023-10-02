import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/widgets/coin_counter.dart';
import 'package:mi_app_imgsound/src/widgets/hearts_indicator.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:audioplayers/audioplayers.dart';

class Game1LevelAdvanced extends StatefulWidget {
  @override
  _Game1LevelAdvancedState createState() => _Game1LevelAdvancedState();
}

class _Game1LevelAdvancedState extends State<Game1LevelAdvanced> {
  int coins = 0;
  int hearts = 3;
  int completedExercises = 2;
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
                        Row(
                          children: List.generate(
                            3,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.0),
                              child: Icon(
                                index < completedExercises ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                                size: 12.0,
                                color: Color(0xFF44A1D6),
                              ),
                            ),
                          ),
                        ),
                        HeartsIndicator(hearts),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Center(
                    child: Center(
                      child: Text(
                        'Sincroniza la siguiente animación con el audio',
                        textAlign: TextAlign.center,  // Añade esta línea
                        style: TextStyle(
                          color: Color(0xFFFDFDFD),
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 21.5,
                        ),
                      ),
                    ),
                  ),
                    SizedBox(height: 20.0),
                    Image.asset('assets/images/nivel_3_rp.png'),
                    SizedBox(height: 20.0),
                    Image.asset('assets/images/componente_rp.png'),
                    SizedBox(height: 20.0),
                    ElevatedButton.icon(
                      onPressed: () async {
    await audioPlayer.play('assets/sounds/ritmo nivel avanzado.mp3', isLocal: true);
},
                      icon: Icon(Icons.play_arrow, color: Color(0xFFFDFDFD)),
                      label: Text(''),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF00D8BB),
                        minimumSize: Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
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
      bottomNavigationBar: CustomFooter(currentPageIndex: 5),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}