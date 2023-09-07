import 'package:flutter/material.dart';
import 'package:question_app/start_screen.dart';
import 'package:question_app/question.dart';
import 'package:question_app/data/questions.dart';
import 'package:question_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var screen = 'start-screen';

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   screen = StartScreen(switchScreen);
  // }
  //Get user input answers
  List<String> userAnswers = [];
  //Get answers data via function
  void userAnswer(String answer) {
    userAnswers.add(answer);
    setState(() {
      if (userAnswers.length == listOfq.length) {
        screen = 'result-screen';
      }
    });
  }

  //Restart quiz method
  void restart() {
    setState(() {
      screen = 'start-screen';
      userAnswers = [];
    });
  }

  void switchScreen() {
    setState(() {
      screen = 'question';
    });
  }

  @override
  Widget build(context) {
    Widget showWidget = StartScreen(switchScreen);
    if (screen == 'question') {
      showWidget = Questions(
        onSelectAnswer: userAnswer,
      );
    }

    if (screen == 'result-screen') {
      showWidget = ResultScreen(
        restart: restart,
        userAnswers: userAnswers,
      );
    }
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 64, 3, 75),
          Color.fromARGB(255, 45, 11, 51)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: showWidget,
      )),
    );
  }
}
