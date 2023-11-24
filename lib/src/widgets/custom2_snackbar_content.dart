import 'package:flutter/material.dart';

class Custom2SnackbarContent extends StatefulWidget {
  final String message;
  final Color? textColor;
  final String? imageAsset;

  Custom2SnackbarContent({
    required this.message,
    this.textColor,
    this.imageAsset,
  });

  static void show(BuildContext context, String message,
      {Color? textColor, String? imageAsset}) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Custom2SnackbarContent(
        message: message,
        textColor: textColor,
        imageAsset: imageAsset,
      ),
    );

    overlay.insert(overlayEntry);

    // Retraso total de 5 segundos: 3 para la imagen, 2 para el mensaje
    Future.delayed(Duration(seconds: 5), () {
      overlayEntry.remove();
    });
  }

  @override
  _Custom2SnackbarContentState createState() => _Custom2SnackbarContentState();
}

class _Custom2SnackbarContentState extends State<Custom2SnackbarContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _showImage = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 500), vsync: this);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));

    _controller.forward();

    // Cambiar de imagen a mensaje después de 3 segundos
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showImage = false;
      });
    });

    // Retraso total de 6 segundos: 3 para la imagen, 3 para el mensaje
    Future.delayed(Duration(seconds: 9), () {
      if (mounted) {
        Navigator.of(context).pop(); // Cierra el Snackbar después de mostrar el mensaje
      }
    });
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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xFF030328), // Color de fondo ajustado
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _showImage
                ? [
                    if (widget.imageAsset != null)
                      Image.asset(
                        widget.imageAsset!,
                        width: 250,
                        height: 250,
                      ),
                  ]
                : [
                    Text(
                      widget.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 18.7,
                        fontWeight: FontWeight.bold,
                        color: widget.textColor ?? Colors.white,
                      ),
                    ),
                  ],
          ),
        ),
      ),
    ),
  );
}
}