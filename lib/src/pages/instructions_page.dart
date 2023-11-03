import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:mi_app_imgsound/src/pages/level1_screen.dart';

class InstructionsPage extends StatefulWidget {
  @override
  _InstructionsPageState createState() => _InstructionsPageState();
}

class _InstructionsPageState extends State<InstructionsPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  

  final List<String> instructions = [
    'Aprende a sincronizar imagen y sonido.',
    'Los acentos en la imagen en movimiento ocurren cuando los objetos colisionan, aparecen o alcanzan un punto culminante en la narrativa visual.',
    'Por otro lado, los silencios en la imagen en movimiento ocurren cuando los objetos desaparecen, salen de escena o se ocultan de alguna manera.',
    'Tu objetivo es sincronizar la imagen con el sonido. Utiliza el controlador Graph Editor para lograr una perfecta armonía entre ambos. ¡Presta atención a los detalles y busca la perfecta sincronización para avanzar!',
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
              if (instructions[index] == 'Aprende a sincronizar imagen y sonido.') {
                return Padding(
                  padding: EdgeInsets.only(top: 216.0),
                  //child: Center(
                    child: Text(
                      instructions[index],
                      style: TextStyle(
                        color: Color(0xFF7CF8FF),
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.7,
                      ),
                      textAlign: TextAlign.center,
                    ),
                 // ),
                );
              } else {
                return InstructionPage(
                  text: instructions[index],
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


  const InstructionPage({
    Key? key,
    this.imagePath,
    this.isCenteredHorizontal = false,
    this.isCenteredVertical = false,
    this.marginTop = 0.0,
    required this.text,
  }) : super(key: key);

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
                    text: '${word.substring(6)} ', // Omite "Style/"
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
                      fontWeight: FontWeight.normal, // Estilo normal para palabras sin "Style/"
                      color: Color(0xFF7CF8FF),
                    ),
                  ),
                );
              }
            }

            return RichText(
              textAlign: TextAlign.center, // Centra el texto
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

  

  @override
  _InstructionPageState createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _animation = IntTween(begin: 0, end: 23).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            String frame = _animation.value.toString().padLeft(5, '0');
            return Image.asset(
              'assets/images/Comp 1_$frame.png',
              gaplessPlayback: true,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.text,
            style: TextStyle(
              color: Color(0xFF7CF8FF),
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
