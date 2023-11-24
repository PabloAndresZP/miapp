import 'dart:async';
import 'package:flutter/material.dart';

class InstructionSnackbar extends StatefulWidget {
  final String imageAsset;

  InstructionSnackbar({required this.imageAsset});

  static void show(BuildContext context, String imageAsset) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => InstructionSnackbar(imageAsset: imageAsset),
    );

    overlay.insert(overlayEntry);

    // El Snackbar se elimina automáticamente después de 4 segundos
    Future.delayed(Duration(seconds: 4), () {
      overlayEntry.remove();
    });
  }

  @override
  _InstructionSnackbarState createState() => _InstructionSnackbarState();
}

class _InstructionSnackbarState extends State<InstructionSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  int _blinkCount = 0;
  Timer? _blinkTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
      reverseDuration: Duration(milliseconds: 500),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Inicia la animación y configura el temporizador para detenerla después de 2 parpadeos
    _controller.repeat(reverse: true);
    _blinkTimer = Timer.periodic(Duration(milliseconds: 1000), (Timer timer) {
      _blinkCount++;
      if (_blinkCount >= 2) {
        _controller.stop();
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _blinkTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 200,
      right: 20,
      child: Align(
        alignment: Alignment.bottomRight,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Image.asset(
            widget.imageAsset,
            width: 50, // Ajusta el tamaño según sea necesario
          ),
        ),
      ),
    );
  }
}