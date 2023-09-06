import 'package:flutter/material.dart';
import 'package:question_app/usable/reuse_button.dart';
//getting data
import 'package:question_app/data/questions.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});
  @override
  State<Questions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  var current = 0;

  void onTap() {
    setState(() {
      current++;
      if (current >= listOfq.length) {
        current = 0;
      }
    });
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              listOfq[current].question,
              softWrap: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  overflow: TextOverflow.visible),
            ),
            const SizedBox(
              height: 30,
            ),
            ...listOfq[current].guess.map((item) {
              return ReuseButton(onTap: onTap, guess: item);
            }),
          ],
        ),
      ),
    );
  }
}
