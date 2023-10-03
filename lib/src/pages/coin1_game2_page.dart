import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:mi_app_imgsound/src/pages/lesson_two_screen.dart'; // Importación añadida

class Coin1Game2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/textura_5.png'),
                fit: BoxFit.cover,
              ),
            ),
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
        SizedBox(height: 20),
                  Text(
                    'Teoría:',
                    style: TextStyle(
                      color: Color(0xFF7CF8FF),
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.7,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Las escalas mayores y menores son dos de las escalas más fundamentales y comúnmente utilizadas en la música occidental.',
                    style: TextStyle(
                      color: Color(0xFF7CF8FF),
                      fontFamily: 'WorkSans',
                      fontSize: 15,
                    ),
                  ),
                  
Text(
  'Una escala mayor se compone de notas que siguen un patrón específico de tonos y semitonos: tono - tono - semitono - tono - tono - tono - semitono. Por ejemplo, la escala de Do mayor incluye las siguientes notas: Do - Re - Mi - Fa - Sol - La - Si - Do. Esta escala se asocia comúnmente con emociones positivas, como la felicidad, la alegría y la energía, debido a su sonoridad brillante y alegre.',
  style: TextStyle(
    color: Color(0xFF7CF8FF),
    fontFamily: 'WorkSans',
    fontSize: 15,
  ),
),
SizedBox(height: 10),
Text(
  'Por otro lado, una escala menor sigue un patrón diferente de tonos y semitonos: tono - semitono - tono - tono - semitono - tono - tono. Por ejemplo, la escala de La menor incluye las siguientes notas: La - Si - Do - Re - Mi - Fa - Sol - La. Esta escala se asocia comúnmente con emociones negativas, como la tristeza, la melancolía y la ansiedad, debido a su sonoridad más oscura y melancólica.',
  style: TextStyle(
    color: Color(0xFF7CF8FF),
    fontFamily: 'WorkSans',
    fontSize: 15,
  ),
),
SizedBox(height: 10),
Text(
  'Es importante entender que esta asociación entre las escalas mayores y menores y las emociones positivas y negativas, respectivamente, es en general y puede variar de una persona a otra. Además, la música es un lenguaje complejo y los compositores pueden usar una variedad de técnicas, como la armonización, la modulación y la instrumentación, para evocar una amplia gama de emociones en una pieza musical.',
  style: TextStyle(
    color: Color(0xFF7CF8FF),
    fontFamily: 'WorkSans',
    fontSize: 15,
  ),
),
                  SizedBox(height: 30),
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