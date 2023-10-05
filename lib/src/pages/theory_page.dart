import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/models/coin_model.dart';
import 'package:provider/provider.dart';
import 'package:mi_app_imgsound/src/pages/coin1_game2_page.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:mi_app_imgsound/src/widgets/rp_accordion_widget.dart';
import 'package:mi_app_imgsound/src/widgets/ls_accordion_widget.dart';

class TheoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hasWonCoin1 = context.watch<CoinModel>().hasWonCoin1;

    return Scaffold(
      appBar: AppBar( toolbarHeight: 80,
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/textura_5.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
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
                  SizedBox(height: 24),
                  Text(
                    '¡Esperamos que disfrutes y aprendas mucho en tu viaje hacia el conocimiento de la relación entre imagen y sonido!',
                    style: TextStyle(
                      color: Color(0xFF7CF8FF),
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  


                  
                  AccordionWidget(
                    title: 'Ritmo Pictórico',
                    items: [
                      'InicialStyle', // Usamos una cadena especial para indicar estilo diferente
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


  
                 
                  SizedBox(height: 24),
                  ListTile(
                    leading: Image.asset('assets/images/ps_01.png', height: 36, width: 36),
                    title: Text(
                      'Pintando Sonido',
                      style: TextStyle(
                          color: Color(0xFF7CF8FF),
                          fontFamily: 'WorkSans',
                          fontSize: 18.7),
                    ),
                    subtitle: hasWonCoin1
                        ? Column(
                            children: [
                              SizedBox(height: 12),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Coin1Game2Page(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 12.0),
                                  child: Text(
                                    'Escalas Mayores y Menores',
                                    style: TextStyle(
                                      color: Color(0xFF00D8BB),
                                      fontFamily: 'WorkSans',
                                      fontSize: 12,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : null,
                  ),
                  
                  SizedBox(height: 24),
                  ListTile(
                    leading: Image.asset('assets/images/ultimo_icono_lienzo_sonoro.png',height: 36, width: 24), // Icono para Lienzo Sonoro
                    title: Text('Lienzo Sonoro',
                        style: TextStyle(
                            color: Color(0xFF7CF8FF),
                            fontFamily: 'WorkSans',
                            fontSize: 18.7)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        
                      ],
                    ),
                  ),
                ],

                
              ),
            ),
          ),
          LsAccordionWidget(
  title: 'Título del Lienzo Sonoro',
  items: ['Item 1', 'Item 2', 'Item 3'],
)

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