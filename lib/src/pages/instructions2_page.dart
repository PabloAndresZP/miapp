import 'package:flutter/material.dart';

import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';
import 'package:mi_app_imgsound/src/pages/video2_intro_page.dart';

const List<String> instructions = [
  'Asocia Style/imágenes con Style/escalas Style/musicales.',
  'Descubre la relación entre las Style/escalas Style/musicales y las Style/imágenes. \n\nUna escala musical es una Style/secuencia Style/organizada de Style/notas que se desplazan en Style/intervalos Style/determinados.',
  'En estos ejercicios, se te presentará una Style/imagen acompañada de dos Style/audios, uno por cada escala. \n\nSelecciona la Style/imagen con la Style/escala que mejor la represente.',
  'Prepárate para un giro inesperado en las dinámicas.\n\nEn este desafío, se te presentará una Style/escala junto con dos Style/imágenes. \n\nElege la Style/imagen que mejor se relacione con esa Style/escala.',
];

const List<String?> images = [
  null,
  'assets/images/instruccion_2.png',
  'assets/images/instruccion_3.png',
  'assets/images/instruccion_4.png',
];

class Instructions2Page extends StatefulWidget {
  @override
  _Instructions2PageState createState() => _Instructions2PageState();
}

class _Instructions2PageState extends State<Instructions2Page> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF030328),
        leading: IconButton(
          icon: Image.asset('assets/images/icon_atras.png', height: 24, width: 24),
          onPressed: () => Navigator.of(context).pop(),
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
        toolbarHeight: 80,
      ),
      body: Stack(
        children: [
          _buildBackgroundContent(),
          _buildButton(),
        ],
      ),
      bottomNavigationBar: CustomFooter(
        currentPageIndex: 5,
        onNotificationDismiss: () {
          // Lógica para despedir la notificación
        },
      ),
    );
  }

  Widget _buildBackgroundContent() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/textura_5.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: PageView.builder(
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
    );
  }

  Widget _buildButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration.zero,
                pageBuilder: (context, animation1, animation2) => Video2IntroPage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF00D8BB),
            onPrimary: Color(0xFFFDFDFD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: Size(313, 48),
            elevation: 5.0,
          ),
          child: Text(
            'Jugar',
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
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
                      text: '${word.substring(6)} ',
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
                textAlign: TextAlign.center,
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
