import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main()
{
  runApp(const RiddleApp());
}

class RiddleApp extends StatelessWidget {
  const RiddleApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}