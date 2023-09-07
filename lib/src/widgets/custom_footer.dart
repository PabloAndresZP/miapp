import 'package:flutter/material.dart';

// Ajusta las rutas de importación según la estructura de tu directorio
import '../pages/instructions_page.dart';
import '../pages/level2_screen.dart';
import '../pages/theory_page.dart';
import '../pages/game3_page.dart';
import '../pages/register_page.dart';

class CustomFooter extends StatelessWidget {
  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xFF030328),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'Teoría',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 15,
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TheoryPage()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Ritmo Pictórico',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 15,
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InstructionsPage()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Pintando Sonido',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 15,
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level2Screen()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Lienzo Sonoro',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 15,
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Game3Page()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Regístrate',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 15,
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFF030328),
      child: Container(
        height: 80.0,
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/icon_teoria.png', height: 24, width: 24),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TheoryPage()),
                      );
                    },
                  ),
                  Text(
                    'Teoría',
                    style: TextStyle(
                      color: Color(0xFFFDFDFD),
                      fontFamily: 'WorkSans',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/icon_home.png', height: 24, width: 24),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: Color(0xFFFDFDFD),
                      fontFamily: 'WorkSans',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/icon_menu.png', height: 24, width: 24),
                    onPressed: () => _showMenu(context),
                  ),
                  Text(
                    'Menú',
                    style: TextStyle(
                      color: Color(0xFFFDFDFD),
                      fontFamily: 'WorkSans',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}