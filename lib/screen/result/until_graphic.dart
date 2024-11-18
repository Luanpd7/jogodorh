import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../quiz/quiz.dart';

class UntilGraphic extends StatelessWidget {
  const UntilGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: SizedBox(
        height: 500,
        width: double.infinity,
        child: Card(
          elevation: 5.0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 26.0),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final barsSpace = 23.0 * constraints.maxWidth / 400;
                  final barsWidth = 10.0 * constraints.maxWidth / 400;
                  return BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.center,
                      barTouchData: BarTouchData(
                        enabled: false,
                      ),
                      titlesData: const FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 50,
                            getTitlesWidget: BottomTitles,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 100,
                            getTitlesWidget: leftTitles,
                          ),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      gridData: FlGridData(
                        show: true,
                        checkToShowHorizontalLine: (value) => value % 5 == 0,
                        getDrawingHorizontalLine: (value) => const FlLine(
                          color: Colors.blue,
                          strokeWidth: 0.3,
                        ),
                        drawVerticalLine: false,
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      groupsSpace: barsSpace,
                      barGroups: getData(barsWidth, barsSpace, context),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<BarChartGroupData> getData(double barsWidth, double barsSpace, context) {
  var state = Provider.of<QuizState>(context);
  return [
    BarChartGroupData(
      x: 0,
      barsSpace: barsSpace,
      barRods: [
        BarChartRodData(
          toY: state.pression,
          color: Colors.blue,
          borderRadius: BorderRadius.zero,
          width: barsWidth,
        ),
      ],
    ),
    BarChartGroupData(
      x: 1,
      barsSpace: barsSpace,
      barRods: [
        BarChartRodData(
          toY: state.resolutionBug,
          color: Colors.blue,
          borderRadius: BorderRadius.zero,
          width: barsWidth,
        ),
      ],
    ),
    BarChartGroupData(
      x: 2,
      barsSpace: barsSpace,
      barRods: [
        BarChartRodData(
          toY: state.commitment,
          color: Colors.blue,
          borderRadius: BorderRadius.zero,
          width: barsWidth,
        ),
      ],
    ),
    BarChartGroupData(
      x: 3,
      barsSpace: barsSpace,
      barRods: [
        BarChartRodData(
          toY: state.group,
          color: Colors.blue,
          borderRadius: BorderRadius.zero,
          width: barsWidth,
        ),
      ],
    ),
    BarChartGroupData(
      x: 4,
      barsSpace: barsSpace,
      barRods: [
        BarChartRodData(
          toY: state.communication,
          color: Colors.blue,
          borderRadius: BorderRadius.zero,
          width: barsWidth,
        ),
      ],
    ),
    BarChartGroupData(
      x: 5,
      barsSpace: barsSpace,
      barRods: [
        BarChartRodData(
          toY: state.organized,
          color: Colors.blue,
          borderRadius: BorderRadius.zero,
          width: barsWidth,
        ),
      ],
    ),
  ];
}

Widget leftTitles(double value, TitleMeta meta) {
  if (value == meta.max) {
    return const Text(
      'Ótimo ',
      style: TextStyle(fontSize: 14, color: Colors.blue),
    );
  } else if (value == meta.max / 2) {
    return const Text(
      'Parcialmente',
      style: TextStyle(fontSize: 14, color: Colors.blue),
    );
  } else if (value == meta.min) {
    return const Text(
      'Abaixo',
      style: TextStyle(fontSize: 14, color: Colors.blue),
    );
  }
  return const SizedBox.shrink();
}

Widget BottomTitles(double value, TitleMeta meta) {
  switch (value.toInt()) {
    case 0:
      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: const Text(
          'Lidar com\n Pressão',
          style: TextStyle(color: Colors.blue),
          textAlign: TextAlign.center,
        ),
      );
    case 1:
      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: const Text(
          'Resolver\nProblema',
          style: TextStyle(color: Colors.blue),
          textAlign: TextAlign.center,
        ),
      );
    case 2:
      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: const Text(
          'Comprometimento',
          style: TextStyle(color: Colors.blue),
          textAlign: TextAlign.center,
        ),
      );
    case 3:
      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: const Text(
          'Grupo',
          style: TextStyle(color: Colors.blue),
          textAlign: TextAlign.center,
        ),
      );
    case 4:
      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: const Text(
          'Comunicação',
          style: TextStyle(color: Colors.blue),
          textAlign: TextAlign.center,
        ),
      );
    case 5:
      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: const Text(
          'Organização',
          style: TextStyle(color: Colors.blue),
          textAlign: TextAlign.center,
        ),
      );
    default:
      return const SizedBox.shrink();
  }
}
