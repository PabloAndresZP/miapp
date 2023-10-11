import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/widgets/coin_counter.dart';
import 'package:mi_app_imgsound/src/widgets/hearts_indicator.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';

class Game3LevelIntermediate extends StatefulWidget {
  @override
  _Game3LevelIntermediateState createState() => _Game3LevelIntermediateState();
}

class _Game3LevelIntermediateState extends State<Game3LevelIntermediate> {
  int coins = 0;
  int hearts = 3;
  int completedExercises = 2;

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
          'Nivel Intermedio LS',
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
                          width: 168.0, // Ajusta el ancho de la barra de progreso aquí
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
                    Center(
                      child: Text(
                        'Graba el sonido que se asocia con la imagen',
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
                    Image.asset('assets/images/ciudad_ls.png'),  // Asegúrate de actualizar la ruta de la imagen si es diferente.
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
