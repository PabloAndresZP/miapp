import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/pages/instructions2_page.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';

class LessonTwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( toolbarHeight: 80,
        backgroundColor: Color(0xFF030328),
        leading: IconButton(
          icon: Image.asset('assets/images/icon_atras.png', height: 24, width: 24),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Lecciones',
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Progresa a través de cada lección para dominar completamente las habilidades del nivel.',
                  style: TextStyle(
                    color: Color(0xFF7CF8FF),
                    fontFamily: 'WorkSans',
                    fontSize: 18.7,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Text(
                  '¡Adelante, comienza tu aprendizaje!',
                  style: TextStyle(
                    color: Color(0xFF7CF8FF),
                    fontFamily: 'WorkSans',
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTextButton('Lección', context, Instructions2Page(), 'assets/images/lec1_ps.png'),
                    buildTextButton('Lección', context, null, 'assets/images/lec2_ps.png', active: false),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTextButton('Lección', context, null, 'assets/images/lec3_ps.png', active: false),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTextButton('Lección', context, null, 'assets/images/lec4_ps.png', active: false),
                    buildTextButton('Lección', context, null, 'assets/images/lec5_ps.png', active: false),
                  ],
                ),
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

  Widget buildTextButton(String label, BuildContext context, Widget? page, String imageAsset, {bool active = true}) {
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
              color: active ? Color(0xFF7CF8FF) : Color(0xFF044A1D6),
              fontFamily: 'WorkSans',
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}