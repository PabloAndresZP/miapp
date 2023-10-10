import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:mi_app_imgsound/src/widgets/video_player_widget.dart';
import 'package:mi_app_imgsound/src/pages/level1_screen.dart';

class InstructionsPage extends StatefulWidget {
  @override
  _InstructionsPageState createState() => _InstructionsPageState();
}

class _InstructionsPageState extends State<InstructionsPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<String> instructions = [
    '\n\n\n\n\n\n\n\n\nAprende a Style/sincronizar Style/imagen y Style/sonido.',
    'Los acentos en la imagen en movimiento ocurren cuando los objetos Style/colisionan, Style/aparecen o alcanzan un Style/punto Style/culminante Style/en Style/la Style/narrativa Style/visual.',
    'Por otro lado, los silencios en la imagen en movimiento ocurren cuando los objetos Style/desaparecen, Style/salen Style/de Style/escena o se Style/ocultan Style/de Style/alguna Style/manera.',
    'Tu objetivo es sincronizar la Style/imagen con el Style/sonido. \n\nUtiliza el controlador Style/Graph Style/Editor para lograr una perfecta armonía entre ambos. \n\n¡Presta atención a los detalles y busca la Style/perfecta Style/sincronización para avanzar!',
  ];

  final List<String> videoPaths = [
    '', // Deja el primer videoPath en blanco para que no muestre el video
    'assets/videos/instrucion_002.mp4',
    'assets/videos/instrucion_003.mp4',
    'assets/videos/instrucion_002.mp4',
  ];

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
        title: const Text(
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
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                currentPage = page;
              });
            },
            itemCount: instructions.length,
            itemBuilder: (context, index) {
              return Center(
                child: InstructionPage(
                  text: instructions[index],
                  videoPath: videoPaths[index],
                ),
              );
            },
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
                      pageBuilder: (context, animation1, animation2) => Level1Screen(), // Navega a Game3Page
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
  final String videoPath;

  const InstructionPage({
    required this.text,
    required this.videoPath,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> textParts = text.split('\n');

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (videoPath.isNotEmpty)
            VideoPlayerWidget(
              videoPath: videoPath,
            ),
          const SizedBox(height: 16.0),
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
