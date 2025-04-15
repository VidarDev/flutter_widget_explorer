import 'package:flutter/material.dart';

// Page d'exploration des Containers
class ContainerExplorerPage extends StatefulWidget {
  const ContainerExplorerPage({super.key});

  @override
  State<ContainerExplorerPage> createState() => _ContainerExplorerPageState();
}

class _ContainerExplorerPageState extends State<ContainerExplorerPage> {
  double _width = 200;
  double _height = 200;
  Color _color = Colors.blue;
  double _borderRadius = 0;
  double _borderWidth = 0;
  Color _borderColor = Colors.black;
  double _margin = 0;
  double _padding = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorer les Containers'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Container à explorer
            Container(
              width: _width,
              height: _height,
              margin: EdgeInsets.all(_margin),
              padding: EdgeInsets.all(_padding),
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_borderRadius),
                border: Border.all(
                  color: _borderColor,
                  width: _borderWidth,
                ),
              ),
              child: const Center(
                child: Text(
                  'Container',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Contrôles
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Largeur: ${_width.toInt()}'),
                  Slider(
                    value: _width,
                    min: 50,
                    max: 300,
                    onChanged: (value) {
                      setState(() {
                        _width = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Text('Hauteur: ${_height.toInt()}'),
                  Slider(
                    value: _height,
                    min: 50,
                    max: 300,
                    onChanged: (value) {
                      setState(() {
                        _height = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Text('Rayon de bordure: ${_borderRadius.toInt()}'),
                  Slider(
                    value: _borderRadius,
                    min: 0,
                    max: 50,
                    onChanged: (value) {
                      setState(() {
                        _borderRadius = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Text('Largeur de bordure: ${_borderWidth.toInt()}'),
                  Slider(
                    value: _borderWidth,
                    min: 0,
                    max: 10,
                    onChanged: (value) {
                      setState(() {
                        _borderWidth = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Text('Marge: ${_margin.toInt()}'),
                  Slider(
                    value: _margin,
                    min: 0,
                    max: 50,
                    onChanged: (value) {
                      setState(() {
                        _margin = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Text('Padding: ${_padding.toInt()}'),
                  Slider(
                    value: _padding,
                    min: 0,
                    max: 50,
                    onChanged: (value) {
                      setState(() {
                        _padding = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _colorButton(Colors.blue, 'Bleu'),
                      _colorButton(Colors.red, 'Rouge'),
                      _colorButton(Colors.green, 'Vert'),
                      _colorButton(Colors.amber, 'Ambre'),
                      _colorButton(Colors.purple, 'Violet'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _borderColorButton(Colors.black, 'Bordure Noire'),
                      _borderColorButton(Colors.white, 'Bordure Blanche'),
                      _borderColorButton(Colors.red, 'Bordure Rouge'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorButton(Color color, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
      ),
      onPressed: () {
        setState(() {
          _color = color;
        });
      },
      child: Text(label),
    );
  }

  Widget _borderColorButton(Color color, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: color == Colors.white ? Colors.black : Colors.white,
        backgroundColor: color,
      ),
      onPressed: () {
        setState(() {
          _borderColor = color;
        });
      },
      child: Text(label),
    );
  }
}
