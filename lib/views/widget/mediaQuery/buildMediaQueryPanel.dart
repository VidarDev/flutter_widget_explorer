import 'package:flutter/material.dart';

class BuildMediaQueryPanel extends StatefulWidget {
  const BuildMediaQueryPanel({super.key});

  @override
  State<BuildMediaQueryPanel> createState() => BuildMediaQueryPanelState();
}

class BuildMediaQueryPanelState extends State<BuildMediaQueryPanel> {
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
              'Panneau d\'information MediaQuery',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const SizedBox(height: 16),

            Row(
              children: [
                const Icon(Icons.fullscreen, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Dimensions: ${mediaQuery.size.width.toInt()} x ${mediaQuery.size.height.toInt()}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(Icons.screen_rotation, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  'Orientation: ${mediaQuery.orientation == Orientation.portrait ? 'Portrait' : 'Landscape'}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),

            Row(
              children: [
                const Icon(Icons.accessibility, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Densité de pixels: ${mediaQuery.devicePixelRatio.toStringAsFixed(2)}',
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.brightness_4, color: Colors.yellow),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Marges systèmes :'
                    'Top: ${mediaQuery.padding.top.toStringAsFixed(1)}'
                    'Right: ${mediaQuery.padding.right.toStringAsFixed(1)}'
                    'Bottom: ${mediaQuery.padding.bottom.toStringAsFixed(1)}'
                    'Left: ${mediaQuery.padding.left.toStringAsFixed(1)}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
