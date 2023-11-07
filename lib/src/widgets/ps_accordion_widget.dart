import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/pages/coin1_game2_page.dart';

class PsAccordionWidget extends StatefulWidget {
  final String title;
  final List<String> items;
  final bool hasWonCoin;

  PsAccordionWidget({
    required this.title,
    required this.items,
    required this.hasWonCoin,
  });

  @override
  _PsAccordionWidgetState createState() => _PsAccordionWidgetState();
}

class _PsAccordionWidgetState extends State<PsAccordionWidget> {
  bool _isExpanded = false;

  @override
Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ListTile(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        contentPadding: EdgeInsets.all(12),
        leading: Image.asset('assets/images/pintando.png', height: 36, width: 36),
        title: Stack(
          alignment: Alignment.centerLeft, // Alineación del texto al centro izquierdo
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: Color(0xFF7CF8FF),
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.bold,
                fontSize: 18.7,
              ),
            ),
            Positioned(
              right: 0, // Alineación del icono a la derecha
              child: AnimatedSwitcher(
  duration: Duration(milliseconds: 400),
  child: _isExpanded
      ? Image.asset(
          'assets/images/icon_arriba.png', // Ruta a la imagen para el estado expandido
          key: Key('up_image'),
          color: Color(0xFF05B8A0),
          height: 24, // Define el tamaño de la imagen
          width: 24,
        )
      : Image.asset(
          'assets/images/icon_abajo.png', // Ruta a la imagen para el estado no expandido
          key: Key('down_image'),
          color: Color(0xFFFDFDFD),
          height: 24, // Define el tamaño de la imagen
          width: 24,
        ),
),

            ),
          ],
        ),
      ),
        if (_isExpanded)
          Column(
            children: widget.items.map((item) {
              if (item.endsWith('Style')) {
                return ListTile(
                  contentPadding: EdgeInsets.only(left: 12),
                  title: Text(
                    item.replaceAll('Style', ''),
                    style: TextStyle(
                      color: Color(0xFF05B8A0),
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                );
              } else if (item == 'Escalas Mayores y Menores' && widget.hasWonCoin) {
                // Mostrar esto solo cuando hasWonCoin es verdadero
                return ListTile(
                  contentPadding: EdgeInsets.only(left: 12),
                  title: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Coin1Game2Page(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/images/moneda_ps_active.png', height: 24, width: 24),
                        SizedBox(width: 12), // Espacio entre la moneda y el texto
                        Text(
                          'Escalas Mayores y Menores',
                          style: TextStyle(
                            color: Color(0xFFFDFDFD),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return ListTile(
                  contentPadding: EdgeInsets.only(left: 12),
                  leading: Image.asset('assets/images/moneda_ps_inactive.png', height: 24, width: 24),
                  title: Text(
                    item,
                    style: TextStyle(
                      color: Color(0xFF05B8A0),
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                );
              }
            }).toList(),
          ),
      ],
    );
  }
}
