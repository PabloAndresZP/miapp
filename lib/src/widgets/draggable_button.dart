import 'package:flutter/material.dart';

class DraggableButton extends StatelessWidget {
  final String text;
  final Function(String) onUpdate;

  DraggableButton(this.text, this.onUpdate);

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: text,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text),
      ),
      feedback: Material(
        child: ElevatedButton(
          onPressed: null,
          child: Text(text),
        ),
      ),
      onDragEnd: (details) {
        if (details.wasAccepted) {
          onUpdate(text);
        }
      },
    );
  }
}