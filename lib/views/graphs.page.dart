import 'package:flutter/material.dart';
import 'package:flutter_widget_explorer/views/widget/charts/bar.chart.dart';
import 'package:flutter_widget_explorer/views/widget/charts/line.chart.dart';
import 'package:flutter_widget_explorer/views/widget/charts/pie.chart.dart';

class GraphsPage extends StatelessWidget {
  const GraphsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('GraphicsView & ChartWidgets'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.teal,
                  style: BorderStyle.solid,
                  width: 2,
                ),
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                children: [
                  const Text(
                    'Line Chart',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyLineChart(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.yellow,
                  style: BorderStyle.solid,
                  width: 2,
                ),
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                children: [
                  const Text(
                    'Pie Chart',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  MyPieChart(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  style: BorderStyle.solid,
                  width: 2,
                ),
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                children: [
                  const Text(
                    'Bar Chart',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  MyBarChart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}