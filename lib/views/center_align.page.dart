import 'package:flutter/material.dart';

// Page d'exploration de Center et Align
class CenterAlignPage extends StatefulWidget {
  const CenterAlignPage({super.key});

  @override
  State<CenterAlignPage> createState() => _CenterAlignPageState();
}

class _CenterAlignPageState extends State<CenterAlignPage> {
  bool _useCenter = true;
  Alignment _alignment = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Center & Align'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            _useCenter ? 'Center' : 'Align',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: _useCenter
                  ? Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.blue,
                        child: const Center(
                          child: Text(
                            'Center',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : Align(
                      alignment: _alignment,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.green,
                        child: const Center(
                          child: Text(
                            'Align',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Utiliser Center'),
                  value: _useCenter,
                  onChanged: (value) {
                    setState(() {
                      _useCenter = value;
                    });
                  },
                ),
                if (!_useCenter) ...[
                  const SizedBox(height: 10),
                  const Text('Alignement:'),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _alignmentButton(Alignment.topLeft, 'Haut Gauche'),
                      _alignmentButton(Alignment.topCenter, 'Haut Centre'),
                      _alignmentButton(Alignment.topRight, 'Haut Droite'),
                      _alignmentButton(Alignment.centerLeft, 'Milieu Gauche'),
                      _alignmentButton(Alignment.center, 'Centre'),
                      _alignmentButton(Alignment.centerRight, 'Milieu Droite'),
                      _alignmentButton(Alignment.bottomLeft, 'Bas Gauche'),
                      _alignmentButton(Alignment.bottomCenter, 'Bas Centre'),
                      _alignmentButton(Alignment.bottomRight, 'Bas Droite'),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _alignmentButton(Alignment alignment, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _alignment == alignment ? Colors.green : null,
      ),
      onPressed: () {
        setState(() {
          _alignment = alignment;
        });
      },
      child: Text(label),
    );
  }
}
