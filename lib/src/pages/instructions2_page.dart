import 'package:flutter/material.dart';

class Instructions2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructions 2'),
      ),
      body: Center(
        child: Image.asset('assets/images/bosquef.png', width: 200.0),
      ),
    );
  }
}