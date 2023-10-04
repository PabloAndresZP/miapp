import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/models/coin_model.dart';
import 'package:provider/provider.dart';
import 'package:mi_app_imgsound/src/pages/coin1_game2_page.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';

class TheoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hasWonCoin1 = context.watch<CoinModel>().hasWonCoin1;

    return Scaffold(
      appBar: AppBar(
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
                  ),
                  SizedBox(height: 24),
                  ListTile(
                    leading: Image.asset('assets/images/rp_01.png', height: 36, width: 36), // Icono para Ritmo Pictórico
                    title: Text('Ritmo Pictórico',
                        style: TextStyle(
                            color: Color(0xFF7CF8FF),
                            fontFamily: 'WorkSans',
                            fontSize: 18.7)),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.only(left: 48), // Añadir sangría
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Inicial',
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Acentos y silencios en la imagen y la música.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Los 'silencios' dentro de una secuencia visual.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.only(left: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Intermedio',
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "La variación de ritmo.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "La sincronización de velocidad entre la animación y el ritmo.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.only(left: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Avanzado',
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Los ritmos amalgamados.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "La polirritmia.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "La combinación de múltiples instrumentos rítmicos.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.only(left: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Experto',
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "La polirritmia y la coordinación con movimientos visuales.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "La sincronización avanzada de animación y ritmo.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
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
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.only(left: 48), 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Inicial',
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Escalas mayores, menores y su asociación con las emociones o estados de ánimo.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Construcción de las escalas menor melódica y menor armónica y su relación con la imagen.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Introducción a los modos.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Construcción de escalas modales.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Escala cromática y escala hexatonal.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.only(left: 48), 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Intermedio',
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Qué es un DAW.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Cómo construir una escala en un DAW.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "De un DAW a un programa audiovisual.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.only(left: 48), 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Avanzado',
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Análisis de canciones.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Asociación de imágenes con canciones.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Creación de emociones en música.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.only(left: 48,), 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Experto',
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Composición de melodías.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Asociación de imágenes con melodías.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Creación de un viaje emocional.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
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
                        SizedBox(height: 12),
                        Text(
                          'Inicial',
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Fundamentos del sonido.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Preparación para la grabación.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Reducción de ruido y eco.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Modificación del sonido.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Análisis de grabaciones.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Intermedio',
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Grabación de secuencias de sonido.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Modificación avanzada del sonido.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Mejorar de la calidad de la grabación.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Avanzado',
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Grabación de Voz.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Creación de escenas sonoras.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Niveles de Volumen.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Experto',
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Creación de Sonidos de Foley.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Edición de Escenas Sonoras Complejas.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Mezcla Final.",
                          style: TextStyle(
                            color: Color(0xFF05B8A0),
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
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