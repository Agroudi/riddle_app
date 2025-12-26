import 'dart:ffi' hide Size;
import 'package:flutter/material.dart';

class PentagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;

    path.moveTo(w / 2, 0);
    path.lineTo(w, h * 0.38);
    path.lineTo(w * 0.82, h);
    path.lineTo(w * 0.18, h);
    path.lineTo(0, h * 0.38);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(_) => false;
}
