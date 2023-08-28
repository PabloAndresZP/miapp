import 'package:flutter/material.dart';

class ExerciseGrid extends StatelessWidget {
  final List<String> exerciseGrid;

  ExerciseGrid({required this.exerciseGrid});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: exerciseGrid.map((String value) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: DragTarget<String>(
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(value),
                  ),
                );
              },
              onWillAccept: (data) => true,
              onAccept: (data) {},
            ),
          );
        }).toList(),
      ),
    );
  }
}