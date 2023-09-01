import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/pages/lesson_two_screen.dart';

class Level2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pintando Sonido'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LessonTwoScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF00D8BB),
                minimumSize: Size(313, 48),
              ),
              child: Text('Nivel Inicial',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xFFFDFDFD),
                  )),
            ),
            SizedBox(height: 20),
            Container(
              width: 5,
              height: 40,
              color: Color(0xFF00D8BB),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: null,  // Desactivado
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF00D8BB),
                minimumSize: Size(313, 48),
              ),
              child: Text('Nivel Intermedio',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xFFFDFDFD),
                  )),
            ),
            SizedBox(height: 20),
            Container(
              width: 5,
              height: 40,
              color: Color(0xFF00D8BB),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: null,  // Desactivado
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF00D8BB),
                minimumSize: Size(313, 48),
              ),
              child: Text('Nivel Avanzado',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xFFFDFDFD),
                  )),
            ),
            SizedBox(height: 20),
            Container(
              width: 5,
              height: 40,
              color: Color(0xFF00D8BB),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: null,  // Desactivado
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF00D8BB),
                minimumSize: Size(313, 48),
              ),
              child: Text('Nivel Experto',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xFFFDFDFD),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}