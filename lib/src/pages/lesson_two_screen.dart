import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/pages/instructions2_page.dart';

class LessonTwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lecciones'),
        backgroundColor: Color(0xFF00D8BB),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Instructions2Page()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF00D8BB),
                minimumSize: Size(313, 48),
              ),
              child: Text('Lección 1',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xFFFDFDFD),
                  )),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF00D8BB),
                minimumSize: Size(313, 48),
              ),
              child: Text('Lección 2',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xFFFDFDFD),
                  )),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF00D8BB),
                minimumSize: Size(313, 48),
              ),
              child: Text('Lección 3',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xFFFDFDFD),
                  )),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF00D8BB),
                minimumSize: Size(313, 48),
              ),
              child: Text('Lección 4',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xFFFDFDFD),
                  )),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF00D8BB),
                minimumSize: Size(313, 48),
              ),
              child: Text('Lección 5',
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