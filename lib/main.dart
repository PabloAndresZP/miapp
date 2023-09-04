import 'package:flutter/material.dart';
import 'src/pages/instructions_page.dart';
import 'src/pages/level2_screen.dart';
import 'src/pages/theory_page.dart';
import 'src/pages/game3_page.dart'; // <-- Importa la nueva página aquí

void main() {
  runApp(const MyApp());
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

  @override
  Widget build(BuildContext context) {
    final button = (String imagePath, String label, VoidCallback onPressed) => GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 48),
          SizedBox(height: 8),
          Text(label,
              style: TextStyle(
                color: Color(0xFF044A1D6),
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.bold,
                fontSize: 17,
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
            image: AssetImage('assets/images/textura_2.png'),
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
                color: Color(0xFF044A1D6),
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.bold,
                fontSize: 21.5,
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
              child: button('assets/images/icon_lienzo.png', 'Lienzo Sonoro', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Game3Page()), // <-- Actualiza aquí
                );
              }),
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: BottomAppBar(
          color: Color(0xFF030328),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/icon_teoria.png', height: 24, width: 24),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TheoryPage()),
                      );
                    },
                  ),
                  Text(
                    'Teoría',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'WorkSans',
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/icon_home.png', height: 24, width: 24),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'WorkSans',
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/icon_menu.png', height: 24, width: 24),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Funcionalidad del Menú no implementada'))
                      );
                    },
                  ),
                  Text(
                    'Menú',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'WorkSans',
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}