import 'package:flutter/material.dart';

class LevelHexagon extends StatelessWidget {
  final int level;
  final int stars;
  final bool locked;
  final VoidCallback? onTap;

  const LevelHexagon({
    super.key,
    required this.level,
    required this.stars,
    required this.locked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomPaint(
            painter: _HexagonPainter(
              color: locked
                  ? Colors.white24
                  : const Color(0xFF6C4AB6),
            ),
            child: SizedBox(
              width: 120,
              height: 120,
              child: Center(
                child: locked
                    ? const Icon(Icons.lock, color: Colors.white70)
                    : Text(
                  '$level',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (i) {
              return Icon(
                Icons.star,
                size: 18,
                color: i < stars ? Colors.amber : Colors.white24,
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _HexagonPainter extends CustomPainter {
  final Color color;

  _HexagonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();

    final w = size.width;
    final h = size.height;

    path.moveTo(w * 0.5, 0);
    path.lineTo(w, h * 0.25);
    path.lineTo(w, h * 0.75);
    path.lineTo(w * 0.5, h);
    path.lineTo(0, h * 0.75);
    path.lineTo(0, h * 0.25);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
