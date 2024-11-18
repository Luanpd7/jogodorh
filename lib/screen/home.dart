import 'package:flutter/material.dart';
import 'package:jogodorh/screen/quiz/quiz.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
              offset: const Offset(0, -200),
              child: const Text(
                'Bem-vindo ao Quiz do RH',
                style: TextStyle(fontSize: 50, fontFamily: 'doto'),
              ),
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.indigo),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Quiz(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Center(
                  child: Text(
                    'Começar',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
