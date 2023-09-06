import 'package:flutter/material.dart';
import 'package:question_app/start_screen.dart';
import 'package:question_app/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget screen = StartScreen(switchScreen);
  void switchScreen() {
    setState(() {
      screen = const Questions();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 64, 3, 75),
          Color.fromARGB(255, 45, 11, 51)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: screen,
      )),
    );
  }
}
