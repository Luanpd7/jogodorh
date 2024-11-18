class Question {
  final String questionText;
  final List<String> options;
  int? correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    this.correctAnswerIndex,
  });

  Question copyWith({int? correctAnswerIndex}) {
    return Question(
      questionText: questionText,
      options: options,
      correctAnswerIndex: correctAnswerIndex,
    );
  }
}
