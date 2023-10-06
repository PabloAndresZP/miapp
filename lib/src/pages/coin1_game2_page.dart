import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:mi_app_imgsound/src/pages/lesson_two_screen.dart'; // Importación añadida

class Coin1Game2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFF030328),
        leading: IconButton(
          icon: Image.asset('assets/images/icon_atras.png', height: 24, width: 24),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LessonTwoScreen()));
          },
        ),
        title: Text(
          'Moneda 1',
          style: TextStyle(
            color: Color(0xFF44A1D6),
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.bold,
            fontSize: 23.4,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xFF060630), // Fondo de color
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset('assets/images/moneda.png', height: 100, width: 100), // Imagen de la moneda centrada horizontalmente
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Teoría:',
                    style: TextStyle(
                      color: Color(0xFF7CF8FF),
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.7,
                    ),
                  ),
                  SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Color(0xFF7CF8FF),
                        fontFamily: 'WorkSans',
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'Las escalas mayores y menores son dos de las escalas más fundamentales y comúnmente utilizadas en la música occidental.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Color(0xFF7CF8FF),
                        fontFamily: 'WorkSans',
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'Una escala mayor se compone de notas que siguen un patrón específico de tonos y semitonos: ',
                        ),
                        TextSpan(
                          text: 'tono - tono - semitono - tono - tono - tono - semitono.',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Image.asset('assets/images/escala_mayor.png'), // Imagen de la escala mayor
                  SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Color(0xFF7CF8FF),
                        fontFamily: 'WorkSans',
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'Por ejemplo, la escala de Do mayor incluye las siguientes notas: ',
                        ),
                        TextSpan(
                          text: 'Do - Re - Mi - Fa - Sol - La - Si - Do.',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Color(0xFF7CF8FF),
                        fontFamily: 'WorkSans',
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'Esta escala se asocia comúnmente con emociones positivas, como ',
                        ),
                        TextSpan(
                          text: 'la felicidad, la alegría',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ', debido a su sonoridad brillante y alegre.',
                        ),
                      ],
                    ),
                  ),


                  
                  SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Color(0xFF7CF8FF),
                        fontFamily: 'WorkSans',
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'Por otro lado, una escala menor sigue un patrón diferente de tonos y semitonos: ',
                        ),
                        TextSpan(
                          text: 'tono - semitono - tono - tono - semitono - tono - tono.',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        TextSpan(
                          text: ' Por ejemplo, la escala de La menor incluye las siguientes notas: ',
                        ),
                        TextSpan(
                          text: 'La - Si - Do - Re - Mi - Fa - Sol - La.',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12),
                  Image.asset('assets/images/escala_menor.png'), // Imagen de la escala menor


                 SizedBox(height: 12),
RichText(
  text: TextSpan(
    style: TextStyle(
      color: Color(0xFF7CF8FF),
      fontFamily: 'WorkSans',
      fontSize: 12,
    ),
    children: [
      TextSpan(
        text: 'Esta escala se asocia comúnmente con emociones negativas, como ',
      ),
      TextSpan(
        text: 'la tristeza, la melancolía y la ansiedad',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      TextSpan(
        text: ', debido a su sonoridad más oscura y melancólica.',
      ),
    ],
  ),
),

                  SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Color(0xFF7CF8FF),
                        fontFamily: 'WorkSans',
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'Es importante entender que esta asociación entre las escalas mayores y menores y las emociones positivas y negativas, respectivamente, es en general y puede variar de una persona a otra. Además, la música es un lenguaje complejo y los compositores pueden usar una variedad de técnicas, como la armonización, la modulación y la instrumentación, para evocar una amplia gama de emociones en una pieza musical.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    height: 60.0,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LessonTwoScreen()));
                      },
                      child: Text(
                        'Seguir ganando monedas',
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
