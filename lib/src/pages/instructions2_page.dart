import 'package:flutter/material.dart';
import 'package:mi_app_imgsound/src/pages/game2_page.dart';

const List<String> instructions = [
  'Instrucción 1',
  'Instrucción 2',
  // ... otras instrucciones
];

class Instructions2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instrucciones',
          style: TextStyle(
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.bold,
            color: Color(0xFFFDFDFD),
          ),
        ),
        backgroundColor: Color(0xFFAAD4E2),
      ),
      body: PageView.builder(
        itemBuilder: (context, index) {
          return InstructionPage(
            text: instructions[index],
            index: index,
            total: instructions.length,
          );
        },
        itemCount: instructions.length,
      ),
    );
  }
}

class InstructionPage extends StatelessWidget {
  final String text;
  final int index;
  final int total;

  const InstructionPage({
    required this.text,
    required this.index,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFAAD4E2),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFFFDFDFD),
            ),
          ),
          const SizedBox(height: 32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              total,
              (i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: i <= index
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Game2Page()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (states) => Color(0xFF00D8BB),
              ),
              minimumSize: MaterialStateProperty.resolveWith<Size>(
                (states) => Size(313, 48),
              ),
              shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            child: Text(
              'Jugar',
              style: TextStyle(
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Color(0xFFFDFDFD),
              ),
            ),
          ),
        ],
      ),
    );
  }
}