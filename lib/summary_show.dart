import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryShow extends StatelessWidget {
  const SummaryShow({super.key, required this.summary});
  final List<Map<String, Object>> summary;
  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summary
              .map((data) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 0, right: 10),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100),
                            ),
                            color: data['userAnswer'] == data['correctAnswer']
                                ? Colors.cyanAccent
                                : Colors.pink),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              ((data['question_index'] as int) + 1).toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'] as String,
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              data['correctAnswer'] as String,
                              style: GoogleFonts.roboto(
                                  color:
                                      const Color.fromARGB(255, 163, 108, 154),
                                  fontSize: 14),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              data['userAnswer'] as String,
                              style: GoogleFonts.roboto(
                                  color:
                                      const Color.fromARGB(255, 25, 182, 221),
                                  fontSize: 14),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      )
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
