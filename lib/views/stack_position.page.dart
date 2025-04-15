import 'package:flutter/material.dart';

// Page d'exploration des Stack et Positioned
class StackPositionedPage extends StatefulWidget {
  const StackPositionedPage({super.key});

  @override
  State<StackPositionedPage> createState() => _StackPositionedPageState();
}

class _StackPositionedPageState extends State<StackPositionedPage> {
  Alignment _stackAlignment = Alignment.center;
  bool _usePositioned = false;
  double _top = 20;
  double _left = 20;
  double? _right;
  double? _bottom;
  bool _useRight = false;
  bool _useBottom = false;
  bool _useWidth = false;
  bool _useHeight = false;
  double _width = 100;
  double _height = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack & Positioned'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Stack${_usePositioned ? ' avec Positioned' : ''}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Stack(
                    alignment: _stackAlignment,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        color: Colors.amber.withValues(alpha: 0.5),
                        child: const Center(
                          child: Text(
                            'Base',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      _usePositioned
                          ? Positioned(
                              top: _useRight && _useBottom ? null : _top,
                              left: _useRight ? null : _left,
                              right: _useRight ? _right : null,
                              bottom: _useBottom ? _bottom : null,
                              width: _useWidth ? _width : null,
                              height: _useHeight ? _height : null,
                              child: Container(
                                color: Colors.blue.withValues(alpha: 0.7),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Positioned',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              width: 100,
                              height: 100,
                              color: Colors.red.withValues(alpha: 0.7),
                              child: const Center(
                                child: Text(
                                  'Second',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.green.withValues(alpha: 0.7),
                        child: const Center(
                          child: Text(
                            'Top',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text('Alignement du Stack:'),
                const SizedBox(height: 5),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
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
                const SizedBox(height: 10),
                SwitchListTile(
                  title: const Text('Utiliser Positioned'),
                  value: _usePositioned,
                  onChanged: (value) {
                    setState(() {
                      _usePositioned = value;
                    });
                  },
                ),
                if (_usePositioned) ...[
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: SwitchListTile(
                          title: const Text('Utiliser right'),
                          value: _useRight,
                          onChanged: (value) {
                            setState(() {
                              _useRight = value;
                              if (value && _right == null) {
                                _right = 20;
                              }
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: SwitchListTile(
                          title: const Text('Utiliser bottom'),
                          value: _useBottom,
                          onChanged: (value) {
                            setState(() {
                              _useBottom = value;
                              if (value && _bottom == null) {
                                _bottom = 20;
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SwitchListTile(
                          title: const Text('Définir width'),
                          value: _useWidth,
                          onChanged: (value) {
                            setState(() {
                              _useWidth = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: SwitchListTile(
                          title: const Text('Définir height'),
                          value: _useHeight,
                          onChanged: (value) {
                            setState(() {
                              _useHeight = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  if (!_useRight) ...[
                    Text('Left: ${_left.toInt()}'),
                    Slider(
                      value: _left,
                      min: 0,
                      max: 250,
                      onChanged: (value) {
                        setState(() {
                          _left = value;
                        });
                      },
                    ),
                  ],
                  if (_useRight) ...[
                    Text('Right: ${_right?.toInt()}'),
                    Slider(
                      value: _right ?? 0.0,
                      min: 0,
                      max: 250,
                      onChanged: (value) {
                        setState(() {
                          _right = value;
                        });
                      },
                    ),
                  ],
                  if (!_useBottom) ...[
                    Text('Top: ${_top.toInt()}'),
                    Slider(
                      value: _top,
                      min: 0,
                      max: 250,
                      onChanged: (value) {
                        setState(() {
                          _top = value;
                        });
                      },
                    ),
                  ],
                  if (_useBottom) ...[
                    Text('Bottom: ${_bottom?.toInt()}'),
                    Slider(
                      value: _bottom ?? 0.0,
                      min: 0,
                      max: 250,
                      onChanged: (value) {
                        setState(() {
                          _bottom = value;
                        });
                      },
                    ),
                  ],
                  if (_useWidth) ...[
                    Text('Width: ${_width.toInt()}'),
                    Slider(
                      value: _width,
                      min: 20,
                      max: 200,
                      onChanged: (value) {
                        setState(() {
                          _width = value;
                        });
                      },
                    ),
                  ],
                  if (_useHeight) ...[
                    Text('Height: ${_height.toInt()}'),
                    Slider(
                      value: _height,
                      min: 20,
                      max: 200,
                      onChanged: (value) {
                        setState(() {
                          _height = value;
                        });
                      },
                    ),
                  ],
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
        backgroundColor: _stackAlignment == alignment ? Colors.blue : null,
      ),
      onPressed: () {
        setState(() {
          _stackAlignment = alignment;
        });
      },
      child: Text(label),
    );
  }
}
