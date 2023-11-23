import 'dart:async';
import 'package:flutter/material.dart';

class Sprite2SnackbarContent extends StatefulWidget {
  final String message;
  final bool isSuccess;
  final Color? textColor;

  Sprite2SnackbarContent({
    required this.message,
    required this.isSuccess,
    this.textColor,
  });

  static void show(BuildContext context, String message, bool isSuccess,
      {Color? textColor}) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Sprite2SnackbarContent(
        message: message,
        isSuccess: isSuccess,
        textColor: textColor,
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(Duration(seconds: 2), () { // Ajusta la duración a 2 segundos
      overlayEntry.remove();
    });
  }

  @override
  _Sprite2SnackbarContentState createState() => _Sprite2SnackbarContentState();
}

class _Sprite2SnackbarContentState extends State<Sprite2SnackbarContent> {
  late Timer _timer;
  int _currentFrame = 0;
  final int totalFrames = 24; // Total de frames en la animación
  final int animationDuration = 2000; // Duración de la animación en milisegundos (2 segundos)

  @override
  void initState() {
    super.initState();
    _startSpriteAnimation();
  }

  void _startSpriteAnimation() {
    int frameDuration = animationDuration ~/ totalFrames;
    _timer = Timer.periodic(
      Duration(milliseconds: frameDuration),
      (Timer timer) {
        if (_currentFrame >= totalFrames - 1) {
          timer.cancel();
        } else {
          setState(() {
            _currentFrame++;
          });
        }
      }
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String frameAsset = 'assets/images/precarga2_000${_currentFrame.toString().padLeft(2, '0')}.png';

    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.black.withOpacity(0.9), // Fondo oscurecido semitransparente
        alignment: Alignment.center,
        child: Image.asset(
          frameAsset, 
          width: MediaQuery.of(context).size.width, 
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
