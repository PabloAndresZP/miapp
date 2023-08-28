import 'package:flutter/material.dart';

class DraggableButton extends StatelessWidget {
  final String text;
  final Function updateExerciseGrid;

  DraggableButton(this.text, this.updateExerciseGrid);

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: text,
      child: ElevatedButton(
        onPressed: () {
          updateExerciseGrid(text);
        },
        child: Text(text),
      ),
      feedback: ElevatedButton(
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}