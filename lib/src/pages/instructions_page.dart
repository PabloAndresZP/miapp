import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:mi_app_imgsound/src/widgets/video_player_widget.dart';
import 'package:mi_app_imgsound/src/widgets/bold_text_widget.dart';

class InstructionsPage extends StatefulWidget {
  @override
  _InstructionsPageState createState() => _InstructionsPageState();
}

class _InstructionsPageState extends State<InstructionsPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<String> instructions = [
    '\n\n\n\n\n\n\n\n\nAprende a sincronizar imagen y sonido',
    'Los acentos en la imagen en movimiento ocurren cuando los objetos colisionan, aparecen o alcanzan un punto culminante en la narrativa visual.',
    'Por otro lado, los silencios en la imagen en movimiento ocurren cuando los objetos desaparecen, salen de escena o se ocultan de alguna manera.',
    'Tu objetivo es sincronizar la imagen con el sonido. \n\nUtiliza el controlador Graph Editor para lograr una perfecta armonía entre ambos. \n\n¡Presta atención a los detalles y busca la perfecta sincronización para avanzar!',
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
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (videoPath.isNotEmpty)
            VideoPlayerWidget(
              videoPath: videoPath,
            ),
          SizedBox(height: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: textParts.map((part) {
              return part.trim().startsWith('Utiliza el controlador Graph Editor')
                  ? Text(textAlign: TextAlign.center,
                      part,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7CF8FF),
                      ),
                    )
                  : BoldTextWidget(
                      text: part,
                      textColor: Color(0xFF7CF8FF),
                    );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: InstructionsPage(),
  ));
}
