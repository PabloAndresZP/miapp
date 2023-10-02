import 'package:flutter/material.dart';

import '../pages/instructions_page.dart';
import '../pages/level2_screen.dart';
import '../pages/theory_page.dart';
import '../pages/profile_page.dart';
import '../pages/game3_page.dart';
import '../pages/register_page.dart';

class CustomFooter extends StatefulWidget {
  final int currentPageIndex; // Índice de la página actual

  CustomFooter({required this.currentPageIndex});

  @override
  _CustomFooterState createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {
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
                  'Perfil',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 15,
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                onTap: () {
                  // Agrega aquí la navegación o acciones para la pantalla de perfil.
                  Navigator.pop(context); // Cierra el menú.
                },
              ),
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
              _buildFooterItem(
                iconPath: 'assets/images/icon_perfil2.png',
                text: 'Perfil',
                index: 0, // Índice de la página a la que se navegará
              ),
              _buildFooterItem(
                iconPath: 'assets/images/icon_teoria.png',
                text: 'Teoría',
                index: 1,
              ),
              _buildFooterItem(
                iconPath: 'assets/images/icon_home.png',
                text: 'Inicio',
                index: 2,
              ),
              _buildFooterItem(
                iconPath: 'assets/images/icon_menu.png',
                text: 'Menú',
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooterItem({
    required String iconPath,
    required String text,
    required int index,
  }) {
    final isActive = index == widget.currentPageIndex;

    return InkWell(
      onTap: () {
        // Navegar a la página correspondiente cuando se toque el ícono.
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()), // Reemplaza con la página de perfil
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TheoryPage()),
            );
            break;
          case 2:
            Navigator.of(context).popUntil((route) => route.isFirst);
            break;
          case 3:
            _showMenu(context);
            break;
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isActive ? Color(0xFF00D8BB) : Colors.transparent,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8),
            child: Image.asset(
              iconPath,
              height: 24,
              width: 24,
              color: isActive ? Colors.white : null,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: isActive ? Color(0xFF00D8BB) : Color(0xFFFDFDFD),
              fontFamily: 'WorkSans',
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}