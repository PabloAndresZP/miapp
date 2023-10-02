import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/pages/game1_level_initial.dart';
import 'package:mi_app_imgsound/src/pages/game1_level_intermediate.dart';
import 'package:mi_app_imgsound/src/pages/game1_level_advanced.dart';
import 'package:mi_app_imgsound/src/pages/game1_level_expert.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';

class Level1Screen extends StatelessWidget {
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
          'Lienzo Sonoro',
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
                buildTextButton('Nivel Inicial', context, Game1LevelInitial()),
                SizedBox(height: 24),
                buildTextButton('Nivel Intermedio', context, Game1LevelIntermediate()),
                SizedBox(height: 24),
                buildTextButton('Nivel Avanzado', context, Game1LevelAdvanced()),
                SizedBox(height: 24),
                buildTextButton('Nivel Experto', context, Game1LevelExpert()),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomFooter(currentPageIndex: 5),
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