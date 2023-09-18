import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/pages/game2_page.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';

const List<String> instructions = [
  'Asocia imágenes con escalas musicales.',
  'Descubre la relación entre las escalas musicales y las imágenes. Una escala musical es una secuencia organizada de notas que se desplazan en intervalos determinados. Es fundamental en la música y nos ayuda tanto a componer como a analizar melodías.',
  'En estos ejercicios, se te presentará una imagen acompañada de dos audios, uno por cada escala. Tu misión es vincular la imagen con la escala que mejor la represente.',
  '¡Un giro inesperado! A veces, las dinámicas cambian. Se te ofrecerá una escala y dos imágenes. Tu tarea será seleccionar la imagen que mejor se relacione con esa escala. Considera las emociones o estados de ánimo que evocan las escalas al tomar tu decisión.',
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
                      backgroundColor: i <= currentPage
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
      bottomNavigationBar: CustomFooter(),
    );
  }
}

class InstructionPage extends StatelessWidget {
  final String text;
  final String? imagePath;

  const InstructionPage({
    required this.text,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath != null) ...[
            Image.asset(imagePath!, height: 150),
            SizedBox(height: 20),
          ],
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF44A1D6),
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.bold,
              fontSize: 18.7,
            ),
          ),
        ],
      ),
    );
  }
}