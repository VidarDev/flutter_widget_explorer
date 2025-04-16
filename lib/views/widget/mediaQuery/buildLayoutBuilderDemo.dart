import 'package:flutter/material.dart';

class BuildLayoutBuilderDemo extends StatefulWidget {
  const BuildLayoutBuilderDemo({super.key});

  @override
  State<BuildLayoutBuilderDemo> createState() => _BuildLayoutBuilderDemoState();
}

class _BuildLayoutBuilderDemoState extends State<BuildLayoutBuilderDemo> {
  double _containerWidth = 300;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Démonstration de LayoutBuilder',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Largeur : '),
                Expanded(
                  child: Slider(
                    value: _containerWidth.clamp(
                      0,
                      (mediaQuery.size.width.toInt() - 64),
                    ),
                    min: 150,
                    max: mediaQuery.size.width.toInt() - 64,
                    divisions: 50,
                    label: _containerWidth.toStringAsFixed(0),
                    onChanged: (value) {
                      setState(() {
                        _containerWidth = value;
                      });
                    },
                  ),
                ),
                Text('${_containerWidth.toInt()} px'),
              ],
            ),

            Center(
              child: Container(
                width: _containerWidth,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 250) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildIcon(),
                          const SizedBox(width: 16),
                          Expanded(child: _buildText()),
                        ],
                      );
                    } else {
                      // Layout vertical (étroit)
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildIcon(),
                          const SizedBox(height: 16),
                          _buildText(),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.touch_app, size: 40, color: Colors.blue),
    );
  }

  Widget _buildText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Texte sur la droite/dessous',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
