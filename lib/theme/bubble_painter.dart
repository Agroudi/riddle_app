import 'package:flutter/material.dart';

class BubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.15);

    canvas.drawCircle(const Offset(20, 24), 5, paint);
    canvas.drawCircle(const Offset(68, 30), 3, paint);
    canvas.drawCircle(const Offset(44, 60), 4, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}
