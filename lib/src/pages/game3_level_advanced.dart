import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/widgets/coin_counter.dart';
import 'package:mi_app_imgsound/src/widgets/hearts_indicator.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';

class Game3LevelAdvanced extends StatefulWidget {
  @override
  _Game3LevelAdvancedState createState() => _Game3LevelAdvancedState();
}

class _Game3LevelAdvancedState extends State<Game3LevelAdvanced> {
  int coins = 0;
  int hearts = 3;
  int completedExercises = 2;

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
          'Nivel Avanzado LS',
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
                      child: Text(
                        'Graba la siguiente frase "Hola como estas"',
                        textAlign: TextAlign.center,  // Añade esta línea
                        style: TextStyle(
                          color: Color(0xFFFDFDFD),
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 21.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Image.asset('assets/images/voz_nivel_avanzado_ls.png'),  // Asegúrate de actualizar la ruta de la imagen si es diferente.
                    SizedBox(height: 20.0),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 36.0,
                            height: 36.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFC92771),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Grabar',
                            style: TextStyle(
                              color: Color(0xFFFDFDFD),
                              fontFamily: 'WorkSans',
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Image.asset('assets/images/instruccion_3_lienzo_sonoro.png'),
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
}