import 'package:flutter/material.dart';
import 'dart:math';

class RoundedPentagonClipper extends CustomClipper<Path> {
  final double cornerRadius;

  RoundedPentagonClipper({this.cornerRadius = 8}); // كل ما تكبر الرقم، الزوايا أملس أكتر

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;

    // النقاط الأساسية للخماسي
    final points = [
      Offset(w / 2, 0),          // top
      Offset(w, h * 0.38),       // topRight
      Offset(w * 0.82, h),       // bottomRight
      Offset(w * 0.18, h),       // bottomLeft
      Offset(0, h * 0.38),       // topLeft
    ];

    final path = Path();

    for (int i = 0; i < points.length; i++) {
      final current = points[i];
      final next = points[(i + 1) % points.length];
      final prev = points[(i - 1 + points.length) % points.length];

      // زاوية نقطة current
      final prevVector = Offset(current.dx - prev.dx, current.dy - prev.dy);
      final nextVector = Offset(next.dx - current.dx, next.dy - current.dy);

      // طول الخط للزاوية
      final prevLength = prevVector.distance;
      final nextLength = nextVector.distance;

      // النقطة قبل الزاوية وبعدها على مسافة cornerRadius
      final p1 = Offset(
        current.dx - (prevVector.dx / prevLength) * cornerRadius,
        current.dy - (prevVector.dy / prevLength) * cornerRadius,
      );
      final p2 = Offset(
        current.dx + (nextVector.dx / nextLength) * cornerRadius,
        current.dy + (nextVector.dy / nextLength) * cornerRadius,
      );

      if (i == 0) {
        path.moveTo(p1.dx, p1.dy);
      } else {
        path.lineTo(p1.dx, p1.dy);
      }

      path.quadraticBezierTo(current.dx, current.dy, p2.dx, p2.dy);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}