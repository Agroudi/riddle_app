import 'package:flutter/material.dart';
import 'package:riddle_app/core/progress_service.dart';
import 'package:riddle_app/screens/quiz_screen.dart';
import 'package:riddle_app/widgets/level_pentagon.dart';

class LevelsScreen extends StatefulWidget {
  const LevelsScreen({super.key});

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  static const int totalLevels = 8;

  late List<int> levelScores;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadProgress();
  }

  Future<void> loadProgress() async {
    levelScores = await ProgressService.loadScores();
    setState(() {
      loading = false;
    });
  }

  bool isUnlocked(int level) {
    if (level == 1) return true;
    return levelScores[level - 2] >= 50;
  }

  int starsFor(int score) {
    if (score >= 90) return 3;
    if (score >= 70) return 2;
    if (score >= 50) return 1;
    return 0;
  }

  Future<void> openLevel(int level) async {
    final int? score = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizScreen(level: level),
      ),
    );

    if (score == null) return;

    if (score > levelScores[level - 1]) {
      levelScores[level - 1] = score;
      await ProgressService.saveScores(levelScores);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 40,
              ),
              itemBuilder: (context, index) {
                final level = index + 1;
                final score = levelScores[level - 1];
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