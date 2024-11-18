import 'package:flutter/material.dart';
import 'package:jogodorh/screen/quiz/quiz.dart';
import 'package:provider/provider.dart';

class QuizOptions extends StatelessWidget {
  const QuizOptions({super.key, required this.options});

  final List<String?>? options;

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context, listen: false);
    return ListView.builder(
      itemCount: options!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 60),
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: Text(options?[index] ?? 'Não há nada'),
            onPressed: () {
              state.selectedOption(index);
              state.lastQuestion(context);
            },
          ),
        );
      },
    );
  }
}
