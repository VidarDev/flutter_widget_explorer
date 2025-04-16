import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyBarChart extends StatefulWidget {
  const MyBarChart({super.key});

  @override
  State<MyBarChart> createState() => MyBarChartState();
}

class MyBarChartState extends State<MyBarChart> {

  List<BarChartGroupData> data = [
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: 0,
          width: 15,
          color: Colors.amber,
        ),
      ],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: 0,
          width: 15,
          color: Colors.amber,
        ),
      ],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: 0,
          width: 15,
          color: Colors.amber,
        ),
      ],
    ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: 0,
          width: 15,
          color: Colors.amber,
        ),
      ],
    ),
    BarChartGroupData(
      x: 5,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: 0,
          width: 15,
          color: Colors.amber,
        ),
      ],
    ),
    BarChartGroupData(
      x: 6,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: 0,
          width: 15,
          color: Colors.amber,
        ),
      ],
    ),
    BarChartGroupData(
      x: 7,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: 0,
          width: 15,
          color: Colors.amber,
        ),
      ],
    ),
    BarChartGroupData(
      x: 8,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: 0,
          width: 15,
          color: Colors.amber,
        ),
      ],
    ),
  ];
  
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        data = [
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                fromY: 0,
                toY: 10,
                width: 15,
                color: Colors.amber,
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                fromY: 0,
                toY: 10,
                width: 15,
                color: Colors.amber,
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                fromY: 0,
                toY: 15,
                width: 15,
                color: Colors.amber,
              ),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                fromY: 0,
                toY: 10,
                width: 15,
                color: Colors.amber,
              ),
            ],
          ),
          BarChartGroupData(
            x: 5,
            barRods: [
              BarChartRodData(
                fromY: 0,
                toY: 11,
                width: 15,
                color: Colors.amber,
              ),
            ],
          ),
          BarChartGroupData(
            x: 6,
            barRods: [
              BarChartRodData(
                fromY: 0,
                toY: 10,
                width: 15,
                color: Colors.amber,
              ),
            ],
          ),
          BarChartGroupData(
            x: 7,
            barRods: [
              BarChartRodData(
                fromY: 0,
                toY: 10,
                width: 15,
                color: Colors.amber,
              ),
            ],
          ),
          BarChartGroupData(
            x: 8,
            barRods: [
              BarChartRodData(
                fromY: 0,
                toY: 10,
                width: 15,
                color: Colors.amber,
              ),
            ],
          ),
        ];
      });
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(
            border: const Border(
              top: BorderSide.none,
              right: BorderSide.none,
              left: BorderSide(width: 1),
              bottom: BorderSide(width: 1),
            ),
          ),
          groupsSpace: 10,
          barGroups: data,
        ),
        duration: Duration(milliseconds: 10000), // Optional
        curve: Curves.linear, // Optional
      ),
    );
  }
}
