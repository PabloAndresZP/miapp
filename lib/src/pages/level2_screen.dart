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
          'Pintando Sonido',
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
          Container(  // Textura de fondo
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/textura_5.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildTextButton('Nivel Inicial', context, LessonTwoScreen()),
                SizedBox(height: 24),
                buildTextButton('Nivel Intermedio', context, GameLevelIntermediate()),
                SizedBox(height: 24),
                buildTextButton('Nivel Avanzado', context, GameLevelAdvanced()),
                SizedBox(height: 24),
                buildTextButton('Nivel Experto', context, GameLevelExpert()),
              ],
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

  Widget buildTextButton(String label, BuildContext context, Widget? page, {bool active = true}) {
    return TextButton(
      onPressed: page == null ? null : () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(
        label,
        style: TextStyle(
          color: active ? Color(0xFF044A1D6) : Colors.grey,
          fontFamily: 'WorkSans',
          fontWeight: FontWeight.bold,
          fontSize: 18.7,
        ),
      ),
    );
  }
}