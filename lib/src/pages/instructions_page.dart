import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:mi_app_imgsound/src/pages/level1_screen.dart';
import 'package:audioplayers/audioplayers.dart';




class InstructionsPage extends StatefulWidget {
  @override
  _InstructionsPageState createState() => _InstructionsPageState();
}

class _InstructionsPageState extends State<InstructionsPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<String> instructions = [
    'Aprende a \nsincronizar imagen y sonido.',
    'Los acentos en la imagen en movimiento ocurren cuando los objetos colisionan, aparecen o alcanzan un punto culminante en la narrativa visual.',
    'Por otro lado, los silencios en la imagen en movimiento ocurren cuando los objetos desaparecen, salen de escena o se ocultan de alguna manera.',
    'Utiliza el controlador Graph Editor para lograr una perfecta armonía entre ambos. \n\n¡Presta atención a los detalles y busca la perfecta sincronización para avanzar!',
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
              if (instructions[index] == 'Aprende a \nsincronizar imagen y sonido.') {
  return Padding(
    padding: EdgeInsets.only(top: 216.0),
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Aprende a\n', // El '\n' mueve el resto del texto a la siguiente línea
            style: TextStyle(
              // Usa el estilo que prefieras para el texto normal
              color: Color(0xFF7CF8FF),
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.normal,
              fontSize: 18.7,
            ),
          ),
          TextSpan(
            text: 'sincronizar imagen y sonido.',
            style: TextStyle(
              // Usa un estilo diferente para el texto en negrita
              color: Color(0xFF7CF8FF),
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.bold,
              fontSize: 18.7,
            ),
          ),
        ],
      ),
    ),
  );


              } else {
                return InstructionPage(
                  text: instructions[index],
                  currentPage: index, // Añadir esto para pasar el índice actual
                );
              }
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
                    MaterialPageRoute(builder: (context) => Level1Screen()),
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
                    color: Color(0xFFFDFDFD),
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
        onNotificationDismiss: () {},
      ),
    );
  }
}

class InstructionPage extends StatefulWidget {
  
  final String text;
  final String? imagePath;
  
  final bool isCenteredHorizontal;
  final bool isCenteredVertical;
  final double marginTop;
  final int currentPage; // Agrega esto
  


  const InstructionPage({
    Key? key,
    this.imagePath,
    this.isCenteredHorizontal = false,
    this.isCenteredVertical = false,
    this.marginTop = 0.0,
    required this.text,
    required this.currentPage, // Agrega esto
  }) : super(key: key);



  

  @override
  _InstructionPageState createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _animation;
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = IntTween(begin: 0, end: 23).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _animationController.repeat(reverse: false);

     // Se ejecuta el método para configurar y reproducir el sonido basado en la página actual.
     _initAudio();
  }

 void _initAudio() {
  // Reproduce el sonido en bucle para el primer y segundo sprite
  if (widget.currentPage == 1 || widget.currentPage == 2) {
    audioPlayer.setReleaseMode(ReleaseMode.loop);

    Source soundSource = widget.currentPage == 1 
      ? AssetSource('sounds/instrucciones2_02.mp3')
      : AssetSource('sounds/instrucciones3_01.mp3');

    // En las versiones recientes de audioplayers usamos setSource y luego resume
    audioPlayer.setSource(soundSource).then((_) => audioPlayer.resume());
  }
}

  @override
  void dispose() {
    _animationController.dispose();
    audioPlayer.stop();  // Asegúrate de detener el audio cuando la página se deshaga
    audioPlayer.dispose(); // Libera los recursos del audioPlayer
    super.dispose();
  }

  String getFrameImage(int compNumber, int frameNumber) {
    String frame = frameNumber.toString().padLeft(5, '0');
    return 'assets/images/Comp ${compNumber}_$frame.png';
  }

Widget buildStyledInstructionText(String instruction) {
  List<InlineSpan> buildTextSpans(String text) {
    final boldWords = [
      'colisionan',
      'aparecen',
      'alcanzan',
      'un',
      'punto',
      'culminante',
      'narrativa',
      'visual',
      'silencios',    
      'acentos',
      'imagen',
      'objetos',
      'desaparecen',
      'movimiento',
      'salen',
      'de',
      'escena',
      'ocultan',
      'de',
      'alguna',
      'manera',
      'Graph',
      'Editor',
      'perfecta',
      'sincronización',
    ];

    List<InlineSpan> spans = [];
    text.split(' ').forEach((word) {
      final trimmedWord = word.replaceAll(RegExp(r'[.,]'), ''); // Remove punctuation for matching
      if (boldWords.contains(trimmedWord)) {
        spans.add(TextSpan(text: '$word ', style: TextStyle(fontWeight: FontWeight.bold)));
      } else {
        spans.add(TextSpan(text: '$word '));
      }
    });

    return spans;
  }

  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(
        color: Color(0xFF7CF8FF),
        fontFamily: 'WorkSans',
        fontWeight: FontWeight.normal,
        fontSize: 18.7,
      ),
      children: buildTextSpans(instruction),
    ),
  );
}



@override
Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      // Se verifica el valor de currentPage y se muestra un AnimatedBuilder adecuado
      if (widget.currentPage == 1) 
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Image.asset(
              getFrameImage(1, _animation.value), // Primer sprite
              gaplessPlayback: true,
            );
          },
        ),
      
      if (widget.currentPage == 2) 
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Image.asset(
              getFrameImage(2, _animation.value),
              gaplessPlayback: true,
            );
          },
        ),

      if (widget.currentPage == 3) 
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Image.asset(
              getFrameImage(3, _animation.value),
              gaplessPlayback: true,
            );
          },
        ),

        


        
      // Texto al final del Column
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: buildStyledInstructionText(widget.text), // Usando la función dentro de la clase
        ),
      ],
    );
  }
}


      
