import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.event, {super.key});
  final void Function() event;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(136, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Learn flutter the fun way!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: event,
            style: OutlinedButton.styleFrom(
                textStyle: const TextStyle(color: Colors.white)),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: const Text(
              'Start Quiz!',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
