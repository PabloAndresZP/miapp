import 'package:flutter/material.dart';

class AccordionWidget extends StatefulWidget {
  final String title;
  final List<String> items;

  AccordionWidget({
    required this.title,
    required this.items,
  });

  @override
  _AccordionWidgetState createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends State<AccordionWidget> {
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
        leading: Image.asset('assets/images/ritmo.png', height: 36, width: 36),
        title: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Color(0xFF7CF8FF),
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.7,
                ),
              ),
            ),
            Positioned(
              right: 0, // Esto posicionará el icono de la flecha hacia la derecha
              top: 0,
              bottom: 0,
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
      // Es una cadena especial que indica un estilo diferente
      return ListTile(
        contentPadding: EdgeInsets.only(left: 12), // Agrega espacio izquierdo para las monedas
        title: Text(
          item.replaceAll('Style', ''), // Quitamos "Style" de la cadena
          style: TextStyle(
            color: Color(0xFF05B8A0),
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      );
    } else {
  // Es una cadena de texto regular
  return ListTile(
    contentPadding: EdgeInsets.only(left: 12), // Agrega espacio izquierdo para las monedas
    leading: Image.asset('assets/images/moneda_rp_inactive.png', height: 24, width: 24),
    title: Text(
      item,
      style: TextStyle(
        color: Color(0xFF05B8A0),
        fontFamily: 'WorkSans',
        fontWeight: FontWeight.normal, // Establece el peso de fuente normal
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
