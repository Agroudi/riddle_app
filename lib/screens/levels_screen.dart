import 'package:flutter/material.dart';
import 'package:riddle_app/screens/quiz_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/level_card.dart';

class LevelsScreen extends StatefulWidget {
  const LevelsScreen({super.key});

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  static const int totalLevels = 8;
  Map<int, int> levelScores = {};

  @override
  void initState() {
    super.initState();
    loadProgress();
  }

  Future<void> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 1; i <= totalLevels; i++) {
        levelScores[i] = prefs.getInt('level_$i') ?? 0;
      }
    });
  }

  Future<void> saveScore(int level, int score) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('level_$level', score);
    setState(() {
      levelScores[level] = score;
    });
  }

  bool isUnlocked(int level) {
    if (level == 1) return true;
    return (levelScores[level - 1] ?? 0) >= 50;
  }

  int starsFor(int score) {
    if (score >= 90) return 3;
    if (score >= 70) return 2;
    if (score >= 50) return 1;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2E1A47),
              Color(0xFF1B1037),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose Level',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                Expanded(
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
                      final score = levelScores[level] ?? 0;
                      final unlocked = isUnlocked(level);

                      return Transform.translate(
                        offset: Offset(
                          index.isOdd ? 30 : 0,
                          index.isOdd ? 40 : 0,
                        ),
                        child: LevelHexagon(
                          level: level,
                          stars: starsFor(score),
                          locked: !unlocked,
                          onTap: unlocked
                              ? () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    QuizScreen(level: level),
                              ),
                            );
                            if (result != null && result is int) {
                              await saveScore(level, result);
                            }
                          }
                              : null,
                        ),
                      );
                    },
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
