import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/pages/level3_screen.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';

const List<String> instructions = [
  'Aprende sobre la Style/grabación / Style/registro Style/de Style/sonido.',
  '\n\nObserva la Style/imagen mostrada y Style/graba el sonido que crees que produce ese objeto.',
  '\n\nLuego, utiliza los controles para Style/ajustar y Style/eliminar cualquier Style/ruido o Style/eco detectado por la aplicación.',
];

const List<String?> images = [
  null,
  'assets/images/mouse.png',
  'assets/images/instruccion_3_lienzo_sonoro.png',
 
];

class Game3Page extends StatefulWidget {
  @override
  _Game3PageState createState() => _Game3PageState();
}

class _Game3PageState extends State<Game3Page> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
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
          'Instrucciones',
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
          PageView.builder(
            onPageChanged: (page) {
              setState(() {
                currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return InstructionPage(
                text: instructions[index],
                imagePath: images[index],
                isCenteredHorizontal: true,
                isCenteredVertical: index == 0,
                marginTop: index == 0 ? 216.0 : 0.0,
              );
            },
            itemCount: instructions.length,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  instructions.length,
                  (i) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: i == currentPage
                          ? Color(0xFF044A1D6)
                          : Color(0xFF044A1D6).withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
          ),

Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration.zero, // Desactiva la animación
                      pageBuilder: (context, animation1, animation2) => Level3Screen(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00D8BB)),
                  minimumSize: MaterialStateProperty.all<Size>(Size(313, 48)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.black.withOpacity(0.3)),
                  elevation: MaterialStateProperty.all<double>(5.0),
                ),
                child: Text(
                  'Jugar',
                  style: TextStyle(
                    color: Color(0xFFFDFDFD),  // Color blanco para el texto "Jugar"
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: CustomFooter(
        currentPageIndex: 5,
        onNotificationDismiss: () {
          // Coloca aquí la lógica para despedir la notificación en esta página específica
          // Puedes establecer el estado de hasWonCoin1 a falso o realizar cualquier otra acción necesaria.
        },
      ),
    );
  }
}

class InstructionPage extends StatelessWidget {
  final String text;
  final String? imagePath;
  final bool isCenteredHorizontal;
  final bool isCenteredVertical;
  final double marginTop;

  const InstructionPage({
    required this.text,
    this.imagePath,
    this.isCenteredHorizontal = false,
    this.isCenteredVertical = false,
    this.marginTop = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> textParts = text.split('\n');

    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: marginTop),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: isCenteredHorizontal ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          if (imagePath != null) ...[
            SizedBox(height: 12),
            Image.asset(imagePath!, height: null, width: isCenteredHorizontal ? null : 150),
            SizedBox(height: 12),
          ],
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: textParts.map((part) {
              final List<InlineSpan> inlineSpans = [];
              final List<String> words = part.trim().split(' ');

              for (final word in words) {
                if (word.startsWith('Style/')) {
                  inlineSpans.add(
                    TextSpan(
                      text: '${word.substring(6)} ', // Ocultar "Style/"
                      style: TextStyle(
                        fontSize: 18.7,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7CF8FF),
                      ),
                    ),
                  );
                } else {
                  inlineSpans.add(
                    TextSpan(
                      text: '$word ',
                      style: TextStyle(
                        fontSize: 18.7,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF7CF8FF),
                      ),
                    ),
                  );
                }
              }

              return RichText(
                textAlign: TextAlign.center, // Centrar el texto
                text: TextSpan(
                  children: inlineSpans,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
