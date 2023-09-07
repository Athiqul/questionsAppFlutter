import 'package:flutter/material.dart';
import 'package:question_app/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.restart, required this.userAnswers});
  //Resart again receive state method
  final void Function() restart;
  //Receive user answers
  final List<String> userAnswers;

  // Define a function with maping user input and actual answers
  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];
    //using for loop to create summary
    for (var i = 0; i < userAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': listOfq[i].question,
        'correctAnswer': listOfq[i].guess[0],
        'userAnswer': userAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('You have correctly answers X out of Y'),
            const SizedBox(
              height: 30,
            ),
            const Text('Answer and questions showing'),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  restart();
                },
                child: const Text('Restart quiz again!'))
          ],
        ),
      ),
    );
  }
}
