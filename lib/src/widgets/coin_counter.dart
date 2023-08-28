import 'package:flutter/material.dart';

class CoinCounter extends StatelessWidget {
  final int coins;

  CoinCounter(this.coins);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.attach_money, size: 24),
        SizedBox(width: 5),
        Text(coins.toString(), style: TextStyle(fontSize: 24)),
      ],
    );
  }
}