import 'package:flutter/material.dart';
import 'package:question_app/data/questions.dart';
import 'package:question_app/summary_show.dart';

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
    final qLen = listOfq.length;
    final summary = getSummary();
    final score = summary.where(
      (element) {
        return element['correctAnswer'] == element['userAnswer'];
      },
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You have correctly answers $score out of $qLen',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            SummaryShow(summary: summary),
            const SizedBox(
              height: 40,
            ),
            TextButton.icon(
                onPressed: () {
                  restart();
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white),
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                label: const Text(
                  'Restart quiz again!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
