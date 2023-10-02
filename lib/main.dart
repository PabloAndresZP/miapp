import 'package:flutter/material.dart';
import 'src/pages/instructions_page.dart';
import 'src/pages/level2_screen.dart';
import 'src/pages/theory_page.dart';
import 'src/pages/game3_page.dart';
import 'src/pages/register_page.dart';
import 'package:provider/provider.dart';
import 'package:mi_app_imgsound/models/coin_model.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CoinModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 123, 90, 180),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Sonido Visual'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xFF030328),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'Teoría',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 15,
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TheoryPage()),
                  );
                },
              ),

              ListTile(
                title: Text(
                  'Ritmo Pictórico',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 15,
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InstructionsPage()),
                  );
                },
              ),
              
              ListTile(
                title: Text(
                  'Pintando Sonido',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 15,
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level2Screen()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Lienzo Sonoro',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 15,
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Game3Page()),
                  );
                },
              ),

                ListTile(
                title: Text(
                  'Regístrate',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 15,
                    color: Color(0xFF7CF8FF),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final button = (String imagePath, String label, VoidCallback onPressed, {double imgHeight = 48}) => GestureDetector(
  onTap: onPressed,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(imagePath, height: imgHeight), // imgHeight se usa aquí
      SizedBox(height: 8),
      Text(label,
          style: TextStyle(
            color: Color(0xFF7CF8FF),
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.bold,
            fontSize: 15,
          )),
    ],
  ),
);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF030328),
        centerTitle: true,
        title: Image.asset('logo_3.png', height: 80),
        toolbarHeight: 80,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/textura_5.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 16),
            Text(
              '¿Qué quieres jugar?',
              style: TextStyle(
                color: Color(0xFF7CF8FF),
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.bold,
                fontSize: 29.3,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button('assets/images/ritmo.png', 'Ritmo Pictórico', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InstructionsPage()),
                  );
                }),
                button('assets/images/pintando.png', 'Pintando Sonido', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level2Screen()),
                  );
                }),
              ],
            ),
            Center(
              child: button('assets/images/lienzo_sonoro.png', 'Lienzo Sonoro', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Game3Page()),
                );
              }, imgHeight: 72), // Ajustado el tamaño de imagen para el botón "Lienzo Sonoro"
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
       bottomNavigationBar: CustomFooter(currentPageIndex: 2),
    );
  }
}