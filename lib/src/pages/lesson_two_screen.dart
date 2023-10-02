import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/pages/instructions2_page.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart'; // Asegúrate de que esta importación esté correcta.

class LessonTwoScreen extends StatelessWidget {
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
          Center( // <-- Para centrar los botones
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextButton('Lección 1', context, Instructions2Page()),
                SizedBox(height: 24),
                buildTextButton('Lección 2', context, null, active: false),
                SizedBox(height: 24),
                buildTextButton('Lección 3', context, null, active: false),
                SizedBox(height: 24),
                buildTextButton('Lección 4', context, null, active: false),
                SizedBox(height: 24),
                buildTextButton('Lección 5', context, null, active: false),
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
      child: Text(label,
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