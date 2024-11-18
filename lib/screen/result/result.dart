import 'package:flutter/material.dart';
import 'package:jogodorh/screen/result/until_graphic.dart';
import 'package:jogodorh/screen/result/util_answer.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFE3F2FD),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              UtilAnswer(),
              SizedBox(
                height: 420,
                width: 800,
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    children: [],
                  ),
                ),
              ),
            ],
          ),
          UntilGraphic(),
        ],
      ),
    );
  }
}
