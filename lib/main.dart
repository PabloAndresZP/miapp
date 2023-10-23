import 'package:flutter/material.dart';
import 'src/pages/instructions_page.dart';
import 'src/pages/level2_screen.dart';
import 'src/pages/game3_page.dart';
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
      title: 'RAV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 123, 90, 180),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'R.A.V.'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final button = (String imagePath, String label, VoidCallback onPressed, {double imgHeight = 100}) => GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: imgHeight),
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
        title: Image.asset('logo_3.png', height: 72),
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
                    PageRouteBuilder(
                      transitionDuration: Duration.zero, // Desactiva la animación
                      pageBuilder: (context, animation1, animation2) => InstructionsPage(),
                    ),
                  );
                }),

                button('assets/images/pintando.png', 'Pintando Sonido', () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration.zero, // Desactiva la animación
                      pageBuilder: (context, animation1, animation2) => Level2Screen(),
                    ),
                  );
                }),
              ],
            ),
            Center(
              child: button('assets/images/lienzo_sonoro.png', 'Lienzo Sonoro', () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration.zero, // Desactiva la animación
                    pageBuilder: (context, animation1, animation2) => Game3Page(),
                  ),
                );
              }),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentPageIndex: 2,
        onNotificationDismiss: () {
          // Coloca aquí la lógica para despedir la notificación en esta página específica
          // Puedes establecer el estado de hasWonCoin1 a falso o realizar cualquier otra acción necesaria.
        },
      ),
    );
  }
}
