import 'package:flutter/material.dart';

class CoinCounter extends StatelessWidget {
  final int coins;

  CoinCounter(this.coins);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.attach_money),
        SizedBox(width: 5),
        Text(coins.toString()),
      ],
    );
  }
}