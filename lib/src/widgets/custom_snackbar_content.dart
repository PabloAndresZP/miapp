import 'package:flutter/material.dart';

class CustomSnackbarContent extends StatefulWidget {
  final String message;
  final bool isSuccess;

  CustomSnackbarContent({required this.message, required this.isSuccess});

  static void show(BuildContext context, String message, bool isSuccess) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => CustomSnackbarContent(message: message, isSuccess: isSuccess),
    );

    overlay.insert(overlayEntry);

    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  @override
  _CustomSnackbarContentState createState() => _CustomSnackbarContentState();
}

class _CustomSnackbarContentState extends State<CustomSnackbarContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: 288,
            height: 288,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: widget.isSuccess ? Color(0xFF00D8BB) : Color(0xFFC92771),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                widget.message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontSize: 18.7,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFDFDFD),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}