import 'package:flutter/material.dart';
import 'package:question_app/usable/reuse_button.dart';
//getting data
import 'package:question_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<Questions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  var current = 0;

  void onTap(answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      current++;
      // if (current >= listOfq.length) {
      //   current = 0;
      // }
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
            Text(listOfq[current].question,
                softWrap: true,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 233, 166, 229),
                    fontSize: 20)),
            const SizedBox(
              height: 30,
            ),
            ...listOfq[current].shuffleGuess().map((item) {
              return ReuseButton(
                  onTap: () {
                    onTap(item);
                  },
                  guess: item);
            }),
          ],
        ),
      ),
    );
  }
}
