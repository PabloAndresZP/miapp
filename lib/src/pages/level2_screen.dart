import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/pages/lesson_two_screen.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:mi_app_imgsound/src/pages/game2_level_intermediate.dart';
import 'package:mi_app_imgsound/src/pages/game2_level_advanced.dart';
import 'package:mi_app_imgsound/src/pages/game2_level_expert.dart';

class Level2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF030328),
        leading: IconButton(
          icon: Image.asset('assets/images/icon_atras.png', height: 24, width: 24),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Niveles',
          style: TextStyle(
            color: Color(0xFF044A1D6),
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.bold,
            fontSize: 23.4,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container( // Textura de fondo
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/textura_5.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Ajuste de márgenes
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Cada nivel representa un desafío en la fascinante',
                    style: TextStyle(
                      color: Color(0xFF7CF8FF),
                      fontFamily: 'WorkSans',
                      fontSize: 18.7,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center, // Alineado al centro
                  ),
                  SizedBox(height: 24, width: 48,), // Separación vertical
                  Text(
                    '¡Que comience tu aventura!',
                    style: TextStyle(
                      color: Color(0xFF7CF8FF),
                      fontFamily: 'WorkSans',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center, // Alineado al centro
                  ),
                  SizedBox(height: 72, width: 10,), // Separación vertical
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildTextButton('Inicial', context, LessonTwoScreen(), 'assets/images/pincel_1.png'),
                      buildTextButton('Intermedio', context, GameLevelIntermediate(), 'assets/images/pincel_2.png'),
                    ],
                  ),
                  SizedBox(height: 12), // Separación vertical reducida
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildTextButton('Avanzado', context, GameLevelAdvanced(), 'assets/images/pincel_3.png'),
                      buildTextButton('Experto', context, GameLevelExpert(), 'assets/images/pincel_4.png'),
                    ],
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

  Widget buildTextButton(String label, BuildContext context, Widget? page, String imageAsset) {
    return Column(
      children: [
        Image.asset(imageAsset, height: 60, width: 60), // Agregamos la imagen
        SizedBox(height: 12), // Separación vertical
        TextButton(
          onPressed: page == null ? null : () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          child: Text(
            label,
            style: TextStyle(
              color: Color(0xFF7CF8FF),
              fontFamily: 'WorkSans',
              fontSize: 15,
              fontWeight: FontWeight.normal, // Cambiamos a normal
            ),
          ),
        ),
      ],
    );
  }
}