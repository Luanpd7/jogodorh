import 'package:flutter/material.dart';
import 'package:jogodorh/screen/entities/question.dart';
import 'package:jogodorh/screen/quiz/quiz_options.dart';
import 'package:jogodorh/screen/quiz/quiz_text.dart';
import 'package:jogodorh/screen/result/result.dart';
import 'package:provider/provider.dart';

class QuizState with ChangeNotifier {
  QuizState() {
    init();
  }

  List<Question> questions = [
    Question(
      questionText: 'Como você lida com trabalho em equipe?',
      options: [
        'Muito bem',
        'Bem',
        'Mais ou menos',
        'Mal',
      ],
    ),
    Question(
      questionText: 'Como você organiza suas tarefas?',
      options: [
        'Muito bem',
        'Bem',
        'Mais ou menos',
        'Mal',
      ],
    ),
    Question(
      questionText: 'Como você lida com pressão no trabalho?',
      options: [
        'Muito bem',
        'Bem',
        'Mais ou menos',
        'Mal',
      ],
    ),
    Question(
      questionText: 'Qual é o seu nível de comprometimento com prazos?',
      options: [
        'Muito comprometido',
        'Comprometido',
        'Comprometido em algumas situações',
        'Pouco comprometido',
      ],
    ),
    Question(
      questionText: 'Como você lida com críticas construtivas?',
      options: [
        'Muito bem',
        'Bem',
        'Mais ou menos',
        'Mal',
      ],
    ),
    Question(
      questionText: 'Qual é a sua capacidade de adaptação a mudanças?',
      options: [
        'Muito alta',
        'Alta',
        'Moderada',
        'Baixa',
      ],
    ),
    Question(
      questionText: 'Como você descreveria sua habilidade de comunicação?',
      options: [
        'Excelente',
        'Boa',
        'Razoável',
        'Fraca',
      ],
    ),
    Question(
      questionText: 'Qual é sua habilidade de resolver problemas?',
      options: [
        'Muito boa',
        'Boa',
        'Razoável',
        'Fraca',
      ],
    ),
    Question(
      questionText: 'Como você lida com o feedback negativo?',
      options: [
        'Aceito bem',
        'Aceito razoavelmente',
        'Tenho dificuldade',
        'Não aceito'
      ],
    ),
    Question(
      questionText: 'Como você prioriza suas tarefas quando está sob pressão?',
      options: [
        'Organizo bem',
        'Organizo razoavelmente',
        'Tenho dificuldade',
        'Não consigo'
      ],
    ),
  ];

  int _currentIndex = 0;

  int down = 0;

  int partially = 0;

  int high = 0;

  double pression = 0;

  double group = 0;

  double organized = 0;

  double commitment = 0;

  double resolutionBug = 0;

  double communication = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void init() {
    notifyListeners();
  }

  void selectedOption(int index) {
    questions[currentIndex] =
        questions[currentIndex].copyWith(correctAnswerIndex: index);
    groupGraphic();
    notifyListeners();
  }

  void lastQuestion(BuildContext context) {
    if (questions[currentIndex] == questions.last) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Result(),
        ),
        (Route<dynamic> route) => false,
      );
    } else {
      currentIndex = currentIndex + 1;
    }
  }

  groupGraphic() {
    switch (currentIndex) {
      case 0:
        {
          if (questions[currentIndex].correctAnswerIndex == 3) {
            group += 1;
            group += group * 2;
          } else if (questions[currentIndex].correctAnswerIndex == 2 ||
              questions[currentIndex].correctAnswerIndex == 1) {
            group += 1;
            group += group * 30;
          } else if (questions[currentIndex].correctAnswerIndex == 0) {
            group += 1;
            group += group * 90;
          }
        }
      case 1:
        {
          if (questions[currentIndex].correctAnswerIndex == 3) {
            organized += 1;
            organized += organized * 2;
          } else if (questions[currentIndex].correctAnswerIndex == 2 ||
              questions[currentIndex].correctAnswerIndex == 1) {
            organized += 1;
            organized += organized * 30;
          } else if (questions[currentIndex].correctAnswerIndex == 0) {
            organized += 1;
            organized += organized * 90;
          }
        }
      case 2:
        {
          if (questions[currentIndex].correctAnswerIndex == 3) {
            pression += 1;
            pression += pression * 2;
          } else if (questions[currentIndex].correctAnswerIndex == 2 ||
              questions[currentIndex].correctAnswerIndex == 1) {
            pression += 1;
            pression += pression * 30;
          } else if (questions[currentIndex].correctAnswerIndex == 0) {
            pression += 1;
            pression += pression * 90;
          }
        }
      case 3:
        {
          if (questions[currentIndex].correctAnswerIndex == 3) {
            commitment += 1;
            commitment += commitment * 2;
          } else if (questions[currentIndex].correctAnswerIndex == 2 ||
              questions[currentIndex].correctAnswerIndex == 1) {
            commitment += 1;
            commitment += commitment * 30;
          } else if (questions[currentIndex].correctAnswerIndex == 0) {
            commitment += 1;
            commitment += commitment * 90;
          }
        }
      case 6:
        {
          if (questions[currentIndex].correctAnswerIndex == 3) {
            communication += 1;
            communication += communication * 2;
          } else if (questions[currentIndex].correctAnswerIndex == 2 ||
              questions[currentIndex].correctAnswerIndex == 1) {
            communication += 1;
            communication += communication * 30;
          } else if (questions[currentIndex].correctAnswerIndex == 0) {
            communication += 1;
            communication += communication * 90;
          }
        }
      case 7:
        {
          if (questions[currentIndex].correctAnswerIndex == 3) {
            resolutionBug += 1;
            resolutionBug += resolutionBug * 2;
          } else if (questions[currentIndex].correctAnswerIndex == 2 ||
              questions[currentIndex].correctAnswerIndex == 1) {
            resolutionBug += 1;
            resolutionBug += resolutionBug * 30;
          } else if (questions[currentIndex].correctAnswerIndex == 0) {
            resolutionBug += 1;
            resolutionBug += resolutionBug * 90;
          }
        }
    }
  }
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      body: Consumer<QuizState>(
        builder: (context, state, _) {
          var quiz = state.questions;
          return Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    var screenWidth = constraints.maxWidth;
                    return screenWidth >= 1100
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                flex: 6,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 80.0, top: 150),
                                  child: QuizText(
                                    text: quiz[state.currentIndex].questionText,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 9,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 200, right: 100, left: 200),
                                  child: QuizOptions(
                                      options:
                                          quiz[state.currentIndex].options),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40.0),
                                child: Center(
                                  child: QuizText(
                                    text: quiz[state.currentIndex].questionText,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 90, left: 30, right: 30),
                                  child: QuizOptions(
                                      options:
                                          quiz[state.currentIndex].options),
                                ),
                              ),
                            ],
                          );
                  },
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -200),
                child: Text(
                  '${state.currentIndex} de ${state.questions.length} perguntas respondidas',
                  style: const TextStyle(color: Colors.indigo),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
