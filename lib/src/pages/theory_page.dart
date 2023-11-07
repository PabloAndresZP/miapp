import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/models/coin_model.dart';
import 'package:provider/provider.dart';

import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:mi_app_imgsound/src/widgets/rp_accordion_widget.dart';
import 'package:mi_app_imgsound/src/widgets/ps_accordion_widget.dart';
import 'package:mi_app_imgsound/src/widgets/ls_accordion_widget.dart';

class TheoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hasWonCoin1 = context.watch<CoinModel>().hasWonCoin1;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFF030328),
        leading: IconButton(
          icon: Image.asset('assets/images/icon_atras.png', height: 24, width: 24),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Teoría',
          style: TextStyle(
            color: Color(0xFF044A1D6),
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.bold,
            fontSize: 21.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xFF060630), // Fondo de color
          ),
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Desbloquea la teoría ganando monedas.',
                    style: TextStyle(
                      color: Color(0xFF7CF8FF),
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.7,
                    ),
                    textAlign: TextAlign.center,
                  ),
                 SizedBox(height: 36),
Padding(
  padding: EdgeInsets.only(bottom: 24), // Aplica padding inferior de 12px
  child: RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(
        // Estilo por defecto para el texto
        color: Color(0xFF7CF8FF),
        fontFamily: 'WorkSans',
        fontWeight: FontWeight.normal,
        fontSize: 15,
      ),
      children: <TextSpan>[
        TextSpan(text: '¡Disfruta y aprende mucho en tu viaje hacia el conocimiento de la relación \nentre '),
        TextSpan(
          text: 'imagen',
          style: TextStyle(fontWeight: FontWeight.bold), // Negrita para la palabra "imagen"
        ),
        TextSpan(text: ' y '),
        TextSpan(
          text: 'sonido',
          style: TextStyle(fontWeight: FontWeight.bold), // Negrita para la palabra "sonido"
        ),
        TextSpan(text: '!'),
      ],
    ),
  ),
),

                  
                  
                  PsAccordionWidget(
                    title: '  Pintando Sonido',
                    items: [
                      'InicialStyle',
                      'Escalas Mayores y Menores',
                      'Construcción de las escalas menor melódica y menor armónica y su relación con la imagen.',
                      'Introducción a los modos.',
                      'Construcción de escalas modales.',
                      'Escala cromática y escala hexatonal.',

                      'IntermedioStyle',
                      'Qué es un DAW.',
                      'Cómo construir una escala en un DAW.',
                      'De un DAW a un programa audiovisual.',

                      'AvanzadoStyle',
                      'Análisis de canciones.',
                      'Asociación de imágenes con canciones.',
                      'Creación de emociones en música.',

                      'ExpertoStyle',
                      'Composición de melodías.',
                      'Asociación de imágenes con melodías.',
                      'Creación de un viaje emocional.',

                    ],
                    hasWonCoin: hasWonCoin1, 
                  ),

                  LsAccordionWidget(
                    title: '  Lienzo Sonoro',
                    items: [
                      'InicialStyle',
                      'Fundamentos del sonido.',
                      'Preparación para la grabación.',
                      'Reducción de ruido y eco.',
                      'Modificación del sonido.',
                      'Análisis de grabaciones.',
                      'IntermedioStyle',
                      'Grabación de secuencias de sonido.',
                      'Modificación avanzada del sonido.',
                      'Mejorar de la calidad de la grabación.',
                      'AvanzadoStyle',
                      'Grabación de Voz.',
                      'Creación de escenas sonoras.',
                      'Niveles de Volumen.',
                      'ExpertoStyle',
                      'Creación de Sonidos de Foley.',
                      'Edición de Escenas Sonoras Complejas.',
                      'Mezcla Final.',
                    ],
                  ),

                AccordionWidget(
                    title: '  Ritmo Pictórico',
                    items: [
                      'InicialStyle',
                      'Acentos y silencios en la imagen y la música.',
                      'Los \'silencios\' dentro de una secuencia visual.',
                      'Yuxtaposición de acentos y silencios para crear un ritmo visual.',
                      'Acentos y silencios en el ritmo.',
                      'Los ritmos.',
                      'IntermedioStyle',
                      'La variación de ritmo.',
                      'La sincronización de velocidad entre la animación y el ritmo.',
                      'El uso de múltiples instrumentos rítmicos en la sincronización con la animación.',
                      'AvanzadoStyle',
                      'Los ritmos amalgamados.',
                      'La polirritmia.',
                      'La combinación de múltiples instrumentos rítmicos.',
                      'ExpertoStyle',
                      'La polirritmia y la coordinación con movimientos visuales.',
                      'La sincronización avanzada de animación y ritmo.',
                      // Agrega más elementos aquí según sea necesario
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomFooter(
        currentPageIndex: 1,
        hasWonCoin1: hasWonCoin1,
        onNotificationDismiss: () {
          // Lógica para despedir la notificación (ocultarla)
          // Puedes establecer el estado de hasWonCoin1 a falso o realizar cualquier otra acción necesaria.
        },
      ),
    );
  }
}
