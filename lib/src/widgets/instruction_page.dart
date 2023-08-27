import 'package:flutter/material.dart';

class InstructionPage extends StatelessWidget {
  final String text;

  InstructionPage({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}