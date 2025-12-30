import 'package:flutter/material.dart';
import 'package:riddle_app/theme/colors.dart';

class LevelStars extends StatelessWidget {
  final int stars;

  const LevelStars({super.key, required this.stars});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (i)
      {
        return Padding(
          padding: EdgeInsets.only(top: i == 1 ? 6 : 0),
          child: Icon(
            Icons.star,
            size: 18,
            color: i < stars ? AppColors.star : Colors.white24
          )
        );
      })
    );
  }
}