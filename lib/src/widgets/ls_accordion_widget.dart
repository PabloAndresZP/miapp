import 'package:flutter/material.dart';

class LsAccordionWidget extends StatefulWidget {
  final String title;
  final List<String> items;

  LsAccordionWidget({
    required this.title,
    required this.items,
  });

  @override
  _LsAccordionWidgetState createState() => _LsAccordionWidgetState();
}

class _LsAccordionWidgetState extends State<LsAccordionWidget> {
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
          contentPadding: EdgeInsets.all(8), // Elimina el espacio predeterminado alrededor del ListTile
          leading: Image.asset('assets/images/ls_01.png', height: 36, width: 36), // Cambia el icono a ls_01.png
          title: Row(
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
              SizedBox(width: 12), // Añade un espacio de 12 px entre la palabra "Lienzo Sonoro" y la flecha
              AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: _isExpanded
                    ? Icon(
                        Icons.keyboard_arrow_up,
                        key: Key('up_icon'),
                        color: Color(0xFF05B8A0),
                        size: 24, // Ajusta el tamaño de la flecha
                      )
                    : Icon(
                        Icons.keyboard_arrow_down,
                        key: Key('down_icon'),
                        color: Color(0xFFFDFDFD),
                        size: 24, // Ajusta el tamaño de la flecha
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
    leading: Image.asset('assets/images/moneda_ls_inactive.png', height: 24, width: 24),
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
