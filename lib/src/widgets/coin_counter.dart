import 'package:flutter/material.dart';

class CoinCounter extends StatelessWidget {
  final int coins;

  CoinCounter(this.coins);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/coin_yellow.png', height: 24, width: 24),
        SizedBox(width: 5),
        Text(
          coins.toString(),
          style: TextStyle(
            fontFamily: 'WorkSans',      // Especifica la familia de fuente.
            fontSize: 18.7,                 // Tamaño de fuente de 15px.
            color: Color(0xFF44A1D6),     // Color especificado.
          ),
        ),
      ],
    );
  }
}