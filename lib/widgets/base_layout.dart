import 'package:flutter/material.dart';

import 'base_painter.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;

  BaseLayout({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[900],
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: CustomPaint(
              painter: BasePainter(),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
