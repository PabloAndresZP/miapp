import 'package:flutter/material.dart';

import '../pages/instructions_page.dart';
import '../pages/level2_screen.dart';
import '../pages/theory_page.dart';
import '../pages/profile_page.dart';
import '../pages/game3_page.dart';

class CustomFooter extends StatefulWidget {
  final int currentPageIndex;
  final bool hasWonCoin1;
  final VoidCallback onNotificationDismiss;

  CustomFooter({
    required this.currentPageIndex,
    this.hasWonCoin1 = false,
    required this.onNotificationDismiss,
  });

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
                leading: Image.asset('assets/images/icon_perfil2.png', height: 24, width: 24),
                title: Text(
                  'Perfil',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 15,
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration.zero, // Desactiva la animación
                    pageBuilder: (context, animation1, animation2) => ProfilePage(name: 'Nombre del Usuario', email: 'usuario@correo.com'),
                  ),
                );
                },
              ),
              ListTile(
                leading: Image.asset('assets/images/icon_teoria.png', height: 24, width: 24),
                title: Text(
                  'Teoría',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 15,
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                onTap: () {
                  widget.onNotificationDismiss();
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      transitionDuration: Duration.zero, // Desactiva la animación
                      pageBuilder: (context, animation1, animation2) => TheoryPage(),
                    ),
                  );
                },
              ),
             
              ListTile(
                leading: Image.asset('assets/images/pintando.png', height: 24, width: 24),
                title: Text(
                  'Pintando Sonido',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 15,
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                onTap: () {

                    Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      transitionDuration: Duration.zero, // Desactiva la animación
                      pageBuilder: (context, animation1, animation2) => Level2Screen(),
                    ),
                  );
                  
                },
              ),
              ListTile(
                leading: Image.asset('assets/images/lienzo_sonoro.png', height: 24, width: 24),
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
                    PageRouteBuilder(
                      transitionDuration: Duration.zero, // Desactiva la animación
                      pageBuilder: (context, animation1, animation2) => Game3Page(),
                    ),
                  );
                },
              ),
             ListTile(
                leading: Image.asset('assets/images/ritmo.png', height: 24, width: 24),
                title: Text(
                  'Ritmo Pictórico',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 15,
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                onTap: () {

                Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      transitionDuration: Duration.zero, // Desactiva la animación
                      pageBuilder: (context, animation1, animation2) => InstructionsPage(),
                    ),
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
                iconPath: 'assets/images/icon_home.png',
                text: 'Inicio',
                index: 2,
              ),
              _buildFooterItem(
                iconPath: 'assets/images/icon_perfil2.png',
                text: 'Perfil',
                index: 0,
              ),
              _buildFooterItem(
                iconPath: 'assets/images/icon_teoria.png',
                text: 'Teoría',
                index: 1,
                showNotification: widget.hasWonCoin1,
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
    bool showNotification = false,
  }) {
    final isActive = index == widget.currentPageIndex;
    final iconColor = isActive ? Color(0xFF00D8BB) : Color(0xFFFDFDFD);

    return InkWell(
      onTap: () {
        switch (index) {
          case 0:
            Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration.zero, // Desactiva la animación
              pageBuilder: (context, animation1, animation2) => ProfilePage(name: 'Nombre del Usuario', email: 'usuario@correo.com'),
            ),
          );
            break;
          case 1:
            widget.onNotificationDismiss();
            Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration.zero, // Desactiva la animación
              pageBuilder: (context, animation1, animation2) => TheoryPage(),
            ),
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
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isActive ? Colors.transparent : null,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  iconPath,
                  height: 24,
                  width: 24,
                  color: iconColor,
                ),
              ),
              if (showNotification)
                GestureDetector(
                  onTap: () {
                    widget.onNotificationDismiss();
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFC92771),
                    ),
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Color(0xFFFDFDFD),
                        fontFamily: 'WorkSans',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
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