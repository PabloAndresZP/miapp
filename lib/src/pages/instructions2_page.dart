import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/pages/game2_page.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';

const List<String> instructions = [
  'Asocia imágenes con escalas musicales.',
  'Descubre la relación entre las escalas musicales y las imágenes.\nUna escala musical es una secuencia organizada de notas que se desplazan en intervalos determinados.\nEs fundamental en la música y nos ayuda tanto a componer como a analizar melodías.',
  'En estos ejercicios, se te presentará una imagen acompañada de dos audios, uno por cada escala.\nTu misión es vincular la imagen con la escala que mejor la represente.',
  '¡Un giro inesperado! A veces, las dinámicas cambian. Se te ofrecerá una escala y dos imágenes.\nTu tarea será seleccionar la imagen que mejor se relacione con esa escala.\nConsidera las emociones o estados de ánimo que evocan las escalas al tomar tu decisión.',
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
        toolbarHeight: 80, // Ajustar esta altura según sea necesario
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
                isCenteredHorizontal: true, // Centrar solo horizontalmente
                isCenteredVertical: index == 0, // Centrar verticalmente solo para el primer ítem
                marginTop: index == 0 ? 216.0 : 0.0, // Margen superior de 60 px solo para el primer ítem
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
                    MaterialPageRoute(builder: (context) => Game2Page()),
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
    TextStyle textStyle;
    double fontSize;
    FontWeight fontWeight;
    Color textColor;

    if (instructions[0].contains('Asocia imágenes con escalas musicales.')) {
      fontSize = 18.7;
      fontWeight = FontWeight.bold; // Negrita
      textColor = Color.fromARGB(255, 119, 4, 29);
    } else if (instructions[1].contains('Descubre la relación entre las escalas musicales y las imágenes.') ||
        text.contains('En estos ejercicios, se te presentará una imagen acompañada de dos audios, uno por cada escala.') ||
        text.contains('¡Un giro inesperado! A veces, las dinámicas cambian. Se te ofrecerá una escala y dos imágenes.')) {
      fontSize = 18.7;
      fontWeight = FontWeight.normal; // Normal
      textColor = Color(0xFF7CF8FF);
    } else if (instructions[2].contains('Una escala musical es una secuencia organizada de notas que se desplazan en intervalos determinados.')) {
      fontSize = 15;
      fontWeight = FontWeight.normal;
      textColor = Color(0xFF7CF8FF);
    } else {
      fontSize = 15;
      fontWeight = FontWeight.normal;
      textColor = Color(0xFF044A1D6);
    }

    textStyle = TextStyle(
      color: textColor,
      fontFamily: 'WorkSans',
      fontSize: fontSize,
      fontWeight: fontWeight,
    );

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
          Text(
            text,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}