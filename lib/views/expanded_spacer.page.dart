import 'package:flutter/material.dart';

// Page d'exploration d'Expanded et Spacer
class ExpandedSpacerPage extends StatefulWidget {
  const ExpandedSpacerPage({super.key});

  @override
  State<ExpandedSpacerPage> createState() => _ExpandedSpacerPageState();
}

class _ExpandedSpacerPageState extends State<ExpandedSpacerPage> {
  bool _isRow = true;
  final List<int> _flexValues = [1, 1, 1];
  bool _useSpacerInstead = false;
  int _spacerFlex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expanded & Spacer')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            _useSpacerInstead ? 'Spacer' : 'Expanded',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Center(
                child: _isRow
                    ? Row(children: _buildChildren())
                    : Column(children: _buildChildren()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SwitchListTile(
                  title: Text(_isRow ? 'Row' : 'Column'),
                  subtitle: Text('Changer pour ${_isRow ? 'Column' : 'Row'}'),
                  value: _isRow,
                  onChanged: (value) {
                    setState(() {
                      _isRow = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                SwitchListTile(
                  title: Text(_useSpacerInstead ? 'Spacer' : 'Expanded'),
                  subtitle: Text(
                    'Changer pour ${_useSpacerInstead ? 'Expanded' : 'Spacer'}',
                  ),
                  value: _useSpacerInstead,
                  onChanged: (value) {
                    setState(() {
                      _useSpacerInstead = value;
                    });
                  },
                ),
                if (!_useSpacerInstead) ...[
                  const SizedBox(height: 10),
                  const Text('Valeurs Flex:'),
                  Row(
                    children: [
                      for (int i = 0; i < _flexValues.length; i++) ...[
                        Expanded(
                          child: Column(
                            children: [
                              Text('Flex ${i + 1}: ${_flexValues[i]}'),
                              Slider(
                                value: _flexValues[i].toDouble(),
                                min: 1,
                                max: 5,
                                divisions: 4,
                                onChanged: (value) {
                                  setState(() {
                                    _flexValues[i] = value.toInt();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ] else ...[
                  const SizedBox(height: 10),
                  Text('Flex Spacer: $_spacerFlex'),
                  Slider(
                    value: _spacerFlex.toDouble(),
                    min: 1,
                    max: 5,
                    divisions: 4,
                    onChanged: (value) {
                      setState(() {
                        _spacerFlex = value.toInt();
                      });
                    },
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildChildren() {
    if (_useSpacerInstead) {
      if (_isRow) {
        return [
          Container(
            width: 60,
            height: 60,
            color: Colors.red,
            child: const Center(
              child: Text('1', style: TextStyle(color: Colors.white)),
            ),
          ),
          Spacer(flex: _spacerFlex),
          Container(
            width: 60,
            height: 60,
            color: Colors.green,
            child: const Center(
              child: Text('2', style: TextStyle(color: Colors.white)),
            ),
          ),
          Spacer(flex: _spacerFlex),
          Container(
            width: 60,
            height: 60,
            color: Colors.blue,
            child: const Center(
              child: Text('3', style: TextStyle(color: Colors.white)),
            ),
          ),
        ];
      } else {
        return [
          Container(
            width: 60,
            height: 60,
            color: Colors.red,
            child: const Center(
              child: Text('1', style: TextStyle(color: Colors.white)),
            ),
          ),
          Spacer(flex: _spacerFlex),
          Container(
            width: 60,
            height: 60,
            color: Colors.green,
            child: const Center(
              child: Text('2', style: TextStyle(color: Colors.white)),
            ),
          ),
          Spacer(flex: _spacerFlex),
          Container(
            width: 60,
            height: 60,
            color: Colors.blue,
            child: const Center(
              child: Text('3', style: TextStyle(color: Colors.white)),
            ),
          ),
        ];
      }
    } else {
      List<Widget> children = [];
      for (int i = 0; i < _flexValues.length; i++) {
        children.add(
          Expanded(
            flex: _flexValues[i],
            child: Container(
              color: i == 0
                  ? Colors.red
                  : i == 1
                      ? Colors.green
                      : Colors.blue,
              child: Center(
                child: Text(
                  'Flex: ${_flexValues[i]}',
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      }
      return children;
    }
  }
}
