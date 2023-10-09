import 'package:flutter/material.dart';

class BoldTextWidget extends StatelessWidget {
  final String text;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;

  BoldTextWidget({
    required this.text,
    this.fontFamily = 'WorkSans',
    this.fontSize = 18.7,
    this.fontWeight = FontWeight.bold,
    this.textColor = const Color(0xFF7CF8FF),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center, // Ahora puedes centrar el texto aquí
      style: TextStyle(
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        color: textColor,
        fontSize: fontSize,
      ),
    );
  }
}
