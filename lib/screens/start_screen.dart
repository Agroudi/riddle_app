import 'package:flutter/material.dart';
import 'package:riddle_app/screens/levels_screen.dart';
import '../../widgets/app_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/wp5083971-purple-aesthetic-ps4-wallpapers.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppButton(
              title: 'Start Game',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LevelsScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
            AppButton(
              title: 'About',
              outlined: true,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('About'),
                    content: const Text(
                      'Riddle App\nCreated by Abdelrahman ElAgroudy',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}