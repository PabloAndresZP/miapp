import 'dart:async';
import 'package:flutter/material.dart';

class SpriteSnackbarContent extends StatefulWidget {
  final String message;
  final bool isSuccess;
  final Color? textColor;

  SpriteSnackbarContent({
    required this.message,
    required this.isSuccess,
    this.textColor,
  });

  static void show(BuildContext context, String message, bool isSuccess,
      {Color? textColor}) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => SpriteSnackbarContent(
        message: message,
        isSuccess: isSuccess,
        textColor: textColor,
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  @override
  _SpriteSnackbarContentState createState() => _SpriteSnackbarContentState();
}

class _SpriteSnackbarContentState extends State<SpriteSnackbarContent> {
  late Timer _timer;
  ValueNotifier<int> _currentFrame;
  final int totalFrames = 24;
  final int animationDuration = 2000;

  _SpriteSnackbarContentState() : _currentFrame = ValueNotifier<int>(0);

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
        if (_currentFrame.value >= totalFrames - 1) {
          timer.cancel();
        } else {
          _currentFrame.value++;
        }
      }
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _currentFrame.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.black.withOpacity(0.9),
        alignment: Alignment.center,
        child: ValueListenableBuilder<int>(
          valueListenable: _currentFrame,
          builder: (context, value, child) {
            String frameAsset = 'assets/images/precarga_000${value.toString().padLeft(2, '0')}.png';
            return Image.asset(
              frameAsset,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            );
          },
        ),
      ),
    );
  }
}
