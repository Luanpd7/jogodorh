import 'package:flutter/material.dart';
import 'package:jogodorh/screen/quiz/quiz.dart';
import 'package:provider/provider.dart';

class UtilAnswer extends StatelessWidget {
  const UtilAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: const Offset(150, 0),
              child: const Text(
                "Perguntas respondidas",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            for (var answer in state.questions)
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "${answer.questionText.split('?').join()} = ${answer.options[answer.correctAnswerIndex ?? 0]}",
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
              )
          ],
        ),
      ),
    );
  }
}
