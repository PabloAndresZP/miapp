import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/models/coin_model.dart';
import 'package:provider/provider.dart';
import 'package:mi_app_imgsound/src/pages/coin1_game2_page.dart';
import 'package:mi_app_imgsound/src/widgets/custom_footer.dart'; // Import para el footer

class TheoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hasWonCoin1 = context.watch<CoinModel>().hasWonCoin1;

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
          'Teoría',
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
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'En esta página se almacenarán las monedas que ganes.',
                    style: TextStyle(
                      color: Color(0xFF7CF8FF),
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.7,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    '¡Esperamos que disfrutes y aprendas mucho!',
                    style: TextStyle(
                      color: Color(0xFF7CF8FF),
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.7,
                    ),
                  ),
                  SizedBox(height: 24),
                  ListTile(
                    title: Text('Ritmo Pictórico', 
                    style: TextStyle(color: Color(0xFF7CF8FF)
                    ,fontFamily: 'WorkSans', fontSize: 18.7)),
                  ),
                  SizedBox(height: 24),
                  ListTile(
  title: Text(
    'Pintando Sonido', 
    style: TextStyle(color: Color(0xFF7CF8FF), fontFamily: 'WorkSans', fontSize: 18.7),
  ),
  subtitle: hasWonCoin1 
  ? Column(
    children: [
      SizedBox(height: 12),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Coin1Game2Page(),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: 12.0),
          child: Text(
            'Moneda 1',
            style: TextStyle(
              color: Color(0xFF00D8BB),
              fontFamily: 'WorkSans',
              fontSize: 18.7,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    ],
  )
  : null,
),
                  SizedBox(height: 24),
                  ListTile(
                    title: Text('Lienzo Sonoro', 
                    style: TextStyle(color: Color(0xFF7CF8FF),fontFamily: 'WorkSans', fontSize: 18.0)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomFooter(currentPageIndex: 1),
    );
  }
}