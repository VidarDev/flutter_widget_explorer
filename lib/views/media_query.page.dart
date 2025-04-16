import 'package:flutter/material.dart';
import './widget/mediaQuery/buildMediaQueryPanel.dart';
import './widget/mediaQuery/buildLayoutBuilderDemo.dart';
import './widget/mediaQuery/buildOrientationDemo.dart';

class MediaQueryViewPage extends StatefulWidget {
  const MediaQueryViewPage({super.key});

  @override
  State<MediaQueryViewPage> createState() => _MediaQueryViewPageState();
}

class _MediaQueryViewPageState extends State<MediaQueryViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MediaQuery & LayoutBuilder')),
      backgroundColor: Colors.lightBlue[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildMediaQueryPanel(),
              const SizedBox(height: 24),

              BuildLayoutBuilderDemo(),
              const SizedBox(height: 24),

              OrientationBuilderDemo(),
            ],
          ),
        ),
      ),
    );
  }
}
