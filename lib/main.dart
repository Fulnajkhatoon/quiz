import 'package:flutter/material.dart';
import 'package:quiz/welcome_screen.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz App",
      home: WelcomeScreen(),
    );
  }
}
