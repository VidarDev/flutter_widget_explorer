import 'package:flutter/material.dart';
import 'dart:math';

class PullToRefreshPage extends StatefulWidget {
  const PullToRefreshPage({super.key});

  @override
  State<PullToRefreshPage> createState() => _PullToRefreshPage();
}

class _PullToRefreshPage extends State<PullToRefreshPage> {
  final Random _random = Random();
  late List<Color> _cellColors;

  @override
  void initState() {
    super.initState();
    _generateRandomColors();
  }

  void _generateRandomColors() {
    _cellColors = List.generate(20, (_) => _randomColor());
  }

  Color _randomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _generateRandomColors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pull to Refresh')),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: _cellColors.length,
          itemBuilder: (context, index) {
            return Container(
              color: _cellColors[index],
              child: ListTile(title: Text('Item $index')),
            );
          },
        ),
      ),
    );
  }
}
