// exercise_grid.dart
import 'package:flutter/material.dart';

class ExerciseGrid extends StatelessWidget {
  final List<String> exerciseGrid;

  const ExerciseGrid({required this.exerciseGrid});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: exerciseGrid.map((text) {
        return Card(
          child: Center(
            child: Text(text),
          ),
        );
      }).toList(),
    );
  }
}