import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:collection/collection.dart';

class MyLineChartData {
  final double x;
  final double y;
  MyLineChartData({required this.x, required this.y});
}

List<MyLineChartData> get lineChartData {
  final data = <double>[10, 30, 23, 41, 581, 100];
  return data
      .mapIndexed(
      ((index, element) => MyLineChartData(x: index.toDouble(), y: element)))
      .toList();
}

class MyLineChart extends StatelessWidget {
  const MyLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LineChart(LineChartData(lineBarsData: [
        LineChartBarData(
            barWidth: 5,
            color: Colors.white,
            spots: lineChartData.map((point) => FlSpot(point.x, point.y)).toList(),
            dotData: FlDotData(show: true)),
      ])),
    );
  }
}