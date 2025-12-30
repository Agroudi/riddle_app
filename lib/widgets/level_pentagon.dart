import 'package:flutter/material.dart';
import 'package:riddle_app/theme/colors.dart';
import 'package:riddle_app/theme/pentagon_clipper.dart';

class LevelPentagon extends StatelessWidget {
  final int level;
  final int stars;
  final bool unlocked;
  final VoidCallback? onTap;

  const LevelPentagon({
    super.key,
    required this.level,
    required this.stars,
    required this.unlocked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: unlocked ? onTap : null,
      child: SizedBox(
        width: 90,
        height: 110,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 0,
              child: SizedBox(
                width: 70,
                height: 30,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      top: 8,
                      child: _star(0)
                    ),
                    Positioned(
                      top: -2,
                      child: _star(1)
                    ),
                    Positioned(
                      right: 0,
                      top: 8,
                      child: _star(2)
                    )
                  ]
                )
              )
            ),
            Positioned(
              top: 16,
              child: ClipPath(
                clipper: RoundedPentagonClipper(),
                child: Container(
                  width: 93,
                  height: 93,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: unlocked
                          ? [
                        levelColors[(level - 1) % levelColors.length].withOpacity(0.95),
                        levelColors[(level - 1) % levelColors.length].withOpacity(0.65)
                      ]
                          : [
                        Colors.grey.shade600,
                        Colors.grey.shade800
                      ]
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.35),
                        blurRadius: 8,
                        offset: const Offset(0, 4)
                      )
                    ]
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(0.12),
                                Colors.transparent
                              ]
                            )
                          )
                        )
                      ),
                      ..._bubbles(),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'LEVEL',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70,
                                letterSpacing: 1
                              )
                            ),
                            Text(
                              level.toString().padLeft(2, '0'),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              )
                            )
                          ]
                        )
                      ),
                      if (!unlocked)
                        const Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Icon(
                            Icons.lock,
                            size: 18,
                            color: Colors.white70
                          )
                        )
                    ]
                  )
                )
              )
            )
          ]
        )
      )
    );
  }

  Widget _star(int index)
  {
    return Icon(
      Icons.star,
      size: 20,
      color: index < stars ? Colors.amber : Colors.white38
    );
  }

  List<Widget> _bubbles()
  {
    return [
      _bubble(12, 14, 4),
      _bubble(46, 10, 5),
      _bubble(24, 36, 6),
      _bubble(50, 40, 4),
      _bubble(32, 58, 3),
      _bubble(14, 52, 3),
      _bubble(60, 30, 2),
      _bubble(39, 20, 3),
      _bubble(60, 58, 10),
      _bubble(60, 30, 10),
      _bubble(20, 70, 6),
    ];
  }

  Widget _bubble(double left, double top, double size)
  {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.18)
        )
      )
    );
  }
}