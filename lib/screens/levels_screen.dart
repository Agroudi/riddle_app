import 'package:flutter/material.dart';
import 'package:riddle_app/screens/quiz_screen.dart';
import 'package:riddle_app/widgets/level_pentagon.dart';

class LevelsScreen extends StatefulWidget {
  const LevelsScreen({super.key});

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  static const int totalLevels = 8;

  final Map<int, int> levelScores = {
    1: 0, 2: 0, 3: 0, 4: 0,
    5: 0, 6: 0, 7: 0, 8: 0,
  };

  bool isUnlocked(int level) {
    if (level == 1) return true;
    return levelScores[level - 1]! >= 50;
  }

  int starsFor(int score) {
    if (score >= 90) return 3;
    if (score >= 70) return 2;
    if (score >= 50) return 1;
    return 0;
  }

  Future<void> openLevel(int level) async {
    final result = await Navigator.push<int>(
      context,
      MaterialPageRoute(
        builder: (_) => QuizScreen(level: level),
      ),
    );

    if (result != null) {
      setState(() {
        if (result > levelScores[level]!) {
          levelScores[level] = result;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> openLevel(int level) async {
      final int? score = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => QuizScreen(level: level),
        ),
      );

      if (score == null) return;

      setState(() {
        levelScores[level] = score;
      });
    }

    bool isUnlocked(int level) {
      if (level == 1) return true;
      return (levelScores[level - 1] ?? 0) >= 50;
    }
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1C1B2F), Color(0xFF11101F)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              itemCount: totalLevels,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 40,
              ),
              itemBuilder: (context, index) {
                final level = index + 1;
                final score = levelScores[level]!;
                final unlocked = isUnlocked(level);

                return LevelPentagon(
                  level: level,
                  stars: starsFor(score),
                  unlocked: unlocked,
                  onTap: unlocked ? () => openLevel(level) : null,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}