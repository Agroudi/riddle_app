import 'package:flutter/material.dart';
import 'package:riddle_app/core/questions_data.dart';
import 'package:riddle_app/models/question_model.dart';
import 'package:riddle_app/widgets/options_button.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final int level;

  const QuizScreen({super.key, required this.level});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final List<Question> questions;
  int currentIndex = 0;
  int score = 0;
  bool locked = false;

  @override
  void initState() {
    super.initState();
    questions = questionsPerLevel[widget.level]!;
  }

  void answer(int selected) {
    if (locked) return;
    locked = true;

    if (selected == questions[currentIndex].correctIndex) {
      score += 10;
    }

    Future.delayed(const Duration(milliseconds: 400), () {
      if (currentIndex < questions.length - 1) {
        setState(() {
          currentIndex++;
          locked = false;
        });
      } else {
        final percentage = (score / (questions.length * 10) * 100).round();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ResultScreen(score: percentage),
          ),
        ).then((_) {
          Navigator.pop(context, percentage);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentIndex];

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
                Text(
                  'Level ${widget.level}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Question ${currentIndex + 1} / ${questions.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    q.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ...List.generate(q.options.length, (i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: OptionButton(
                      text: q.options[i],
                      onTap: () => answer(i),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}