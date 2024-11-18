import 'package:flutter/material.dart';

class QuizText extends StatelessWidget {
  const QuizText({super.key, required this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Text(
        text ?? 'Não há nada',
        style: const TextStyle(
          fontSize: 40,
          color: Colors.indigo,
        ),
        overflow: TextOverflow.fade,
      ),
    );
  }
}
