import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/pages/level1_screen.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';

const List<String> instructions = [
  'Aprende a sincronizar imagen y sonido.',
  'Los acentos en la imagen en movimiento ocurren cuando los objetos colisionan, aparecen o alcanzan un punto culminante en la narrativa visual.',
  'Por otro lado, los silencios en la imagen en movimiento ocurren cuando los objetos desaparecen, salen de escena o se ocultan de alguna manera.',
  'Tu objetivo es sincronizar la imagen con el sonido. Utiliza el controlador Graph Editor para lograr una perfecta armonía entre ambos. ¡Presta atención a los detalles y busca la perfecta sincronización para avanzar!',
];

const List<String?> images = [
  null,
  'assets/images/intruccion_1_rp.png',
  'assets/images/intruccion_2_rp.png',
  'assets/images/intruccion_3_rp.png',
];

class InstructionsPage extends StatefulWidget {
  @override
  _InstructionsPageState createState() => _InstructionsPageState();
}

class _InstructionsPageState extends State<InstructionsPage> {
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
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(
                      color: Color(0xFFFDFDFD),
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                child: Text('Jugar'),
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