import 'package:flutter/material.dart';
import 'package:quiz1/answer_button.dart';
import 'package:quiz1/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QScreen extends StatefulWidget {
  const QScreen({super.key ,required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QScreen> createState() {
    return _QScreenState();
  }
}

class _QScreenState extends State<QScreen> {
  
  var curQuesIndex = 0;

  void answerIndex(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      curQuesIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQues = questions[curQuesIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQues.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 27, 3, 56),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQues.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(
                  answerText: answer, 
                  onTap: (){
                  answerIndex(answer);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
