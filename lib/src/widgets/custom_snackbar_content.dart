import 'package:flutter/material.dart';

class CustomSnackbarContent extends StatefulWidget {
  final String message;
  final bool isSuccess;
  final Color? textColor;
  final String? imageAsset;

  CustomSnackbarContent({
    required this.message,
    required this.isSuccess,
    this.textColor,
    this.imageAsset,
  });

  static void show(BuildContext context, String message, bool isSuccess,
      {Color? textColor, String? imageAsset}) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => CustomSnackbarContent(
        message: message,
        isSuccess: isSuccess,
        textColor: textColor,
        imageAsset: imageAsset,
      ),
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
      child: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.9),
          ),
          Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                width: 312,
                height: 312,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.imageAsset != null)
                      Image.asset(
                        widget.imageAsset!,
                        width: 80,
                        height: 80,
                      ),
                    Text(
                      widget.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 18.7,
                        fontWeight: FontWeight.bold,
                        color: widget.textColor ?? Color(0xFF00D8BB),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
