import 'package:flutter/material.dart';
import 'src/pages/instructions_page.dart';
import 'package:mi_app_imgsound/src/pages/instructions2_page.dart';
import 'src/widgets/coin_counter.dart';

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
      home: const HomePage(title: 'Paisaje Sonoro'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEE715D),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                // Lógica para abrir el menú hamburguesa
              },
            ),
            Text(
              'Menú',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'WorkSans',
                fontSize: 8,
              ),
            ),
          ],
        ),
        title: Image.asset('assets/logo.png'), // Ruta a tu logo
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  // Lógica para abrir el buscador
                },
              ),
              Text(
                'Buscar',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'WorkSans',
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            CoinCounter(0),
            Text(
              '¿Qué quieres jugar?',
              style: TextStyle(
                color: Color(0xFF075B96),
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.bold,
                fontSize: 21.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16), // Espacio entre elementos
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InstructionsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFAAD4E2),
                minimumSize: Size(216, 216),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(108),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.music_note, size: 48, color: Colors.white),
                  SizedBox(height: 8),
                  Text('Ritmo Pictórico', 
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  )),
                ],
              ),
            ),
            const SizedBox(height: 36), // Espacio entre elementos
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Instructions2Page()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFAAD4E2),
                minimumSize: Size(216, 216),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(108),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.brush, size: 48, color: Colors.white),
                  SizedBox(height: 8),
                  Text('Pintando Sonido',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  )),
                ],
              ),
            ),
            const SizedBox(height: 36), // Espacio entre elementos
            ElevatedButton(
              onPressed: () {
                // Lógica para el botón Lienzo Sonoro
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFAAD4E2),
                minimumSize: Size(216, 216),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(108),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.brush, size: 48, color: Colors.white), // Icono que desees
                  SizedBox(height: 8), // Espacio entre el icono y el texto
                  Text('Lienzo Sonoro',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  )),
                ],
              ),
            ),
            const SizedBox(height: 36), // Espacio adicional antes del footer
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFEE715D),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.help, color: Colors.white),
                  onPressed: () {
                    // Lógica para el icono de ayuda
                  },
                ),
                Text(
                  'Teoría',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'WorkSans',
                    fontSize: 8,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    // Lógica para el icono de home
                  },
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'WorkSans',
                    fontSize: 8,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () {
                    // Lógica para avanzar
                  },
                ),
                Text(
                  'Avanzar',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'WorkSans',
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}