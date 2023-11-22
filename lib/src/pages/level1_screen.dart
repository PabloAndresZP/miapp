import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/pages/game1_level_initial.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:mi_app_imgsound/src/pages/game1_level_intermediate.dart';
import 'package:mi_app_imgsound/src/pages/game1_level_advanced.dart';
import 'package:mi_app_imgsound/src/pages/game1_level_expert.dart';

class Level1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xFF030328),
        leading: IconButton(
          icon: Image.asset('assets/images/icon_atras.png', height: 24, width: 24),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          '       Niveles RP',
          style: TextStyle(
            color: Color(0xFF044A1D6),
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.bold,
            fontSize: 23.4,
          ),
          //centerTitle: true,
        ),
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
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Cada nivel presenta un desafío único en el apasionante mundo de la sincronización.\n\n',
                    style: TextStyle(
                      color: Color(0xFF7CF8FF),
                      fontFamily: 'WorkSans',
                      fontSize: 18.7,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '¡Que comience tu aventura!\n\n',
                    style: TextStyle(
                      color: Color(0xFF7CF8FF),
                      fontFamily: 'WorkSans',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12), // Espacio vertical entre los textos y los botones
                    child: Wrap(
                      spacing: 24, // Espacio horizontal entre los botones
                      runSpacing: 12, // Espacio vertical entre las filas de botones
                      alignment: WrapAlignment.center, // Alineación central
                      children: [
                        buildTextButton('Inicial', context, Game1LevelInitial(), 'assets/images/niveles_rp_01.png'),
                        buildTextButton('Medio', context, Game1LevelIntermediate(), 'assets/images/niveles_rp_02.png'),
                        buildTextButton('Avanzado', context, Game1LevelAdvanced(), 'assets/images/niveles_rp_03.png'),
                        buildTextButton('Experto', context, Game1LevelExpert(), 'assets/images/niveles_rp_04.png'),
                      ],
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
          // Lógica para despedir la notificación en esta página específica
          // Puedes establecer el estado de hasWonCoin1 a falso o realizar cualquier otra acción necesaria.
        },
      ),
    );
  }

  Widget buildTextButton(String label, BuildContext context, Widget? page, String imageAsset) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (page != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            }
          },
          child: Column(
            children: [
              Image.asset(imageAsset, height: 100, width: 100),
              SizedBox(height: 12),
              Text(
                label,
                style: TextStyle(
                  color: Color(0xFF7CF8FF),
                  fontFamily: 'WorkSans',
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
