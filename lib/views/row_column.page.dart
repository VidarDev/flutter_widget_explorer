import 'package:flutter/material.dart';

// Page d'exploration de Row et Column
class RowColumnPage extends StatefulWidget {
  const RowColumnPage({super.key});

  @override
  State<RowColumnPage> createState() => _RowColumnPageState();
}

class _RowColumnPageState extends State<RowColumnPage> {
  bool _isRow = true;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  MainAxisSize _mainAxisSize = MainAxisSize.max;
  int _childCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isRow ? 'Row' : 'Column'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            _isRow ? 'Row' : 'Column',
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
                child: _isRow
                    ? Row(
                        mainAxisAlignment: _mainAxisAlignment,
                        crossAxisAlignment: _crossAxisAlignment,
                        mainAxisSize: _mainAxisSize,
                        children: _buildChildren(),
                      )
                    : Column(
                        mainAxisAlignment: _mainAxisAlignment,
                        crossAxisAlignment: _crossAxisAlignment,
                        mainAxisSize: _mainAxisSize,
                        children: _buildChildren(),
                      ),
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
                const Text('MainAxisAlignment:'),
                const SizedBox(height: 5),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    _mainAlignButton(MainAxisAlignment.start, 'Start'),
                    _mainAlignButton(MainAxisAlignment.center, 'Center'),
                    _mainAlignButton(MainAxisAlignment.end, 'End'),
                    _mainAlignButton(
                        MainAxisAlignment.spaceBetween, 'SpaceBetween'),
                    _mainAlignButton(
                        MainAxisAlignment.spaceAround, 'SpaceAround'),
                    _mainAlignButton(
                        MainAxisAlignment.spaceEvenly, 'SpaceEvenly'),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('CrossAxisAlignment:'),
                const SizedBox(height: 5),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    _crossAlignButton(CrossAxisAlignment.start, 'Start'),
                    _crossAlignButton(CrossAxisAlignment.center, 'Center'),
                    _crossAlignButton(CrossAxisAlignment.end, 'End'),
                    _crossAlignButton(CrossAxisAlignment.stretch, 'Stretch'),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('MainAxisSize:'),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _mainSizeButton(MainAxisSize.max, 'Max'),
                    const SizedBox(width: 10),
                    _mainSizeButton(MainAxisSize.min, 'Min'),
                  ],
                ),
                const SizedBox(height: 10),
                Text('Nombre d\'enfants: $_childCount'),
                Slider(
                  value: _childCount.toDouble(),
                  min: 1,
                  max: 5,
                  divisions: 4,
                  onChanged: (value) {
                    setState(() {
                      _childCount = value.toInt();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildChildren() {
    return List.generate(
      _childCount,
      (index) {
        if (_isRow) {
          return Container(
            width: 60,
            height: 60 +
                (index * 20), // Hauteurs différentes pour montrer l'alignement
            color: Colors.primaries[index % Colors.primaries.length],
            child: Center(
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        } else {
          return Container(
            width: 60 +
                (index * 20), // Largeurs différentes pour montrer l'alignement
            height: 60,
            color: Colors.primaries[index % Colors.primaries.length],
            child: Center(
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _mainAlignButton(MainAxisAlignment alignment, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _mainAxisAlignment == alignment ? Colors.blue : null,
      ),
      onPressed: () {
        setState(() {
          _mainAxisAlignment = alignment;
        });
      },
      child: Text(label),
    );
  }

  Widget _crossAlignButton(CrossAxisAlignment alignment, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _crossAxisAlignment == alignment ? Colors.green : null,
      ),
      onPressed: () {
        setState(() {
          _crossAxisAlignment = alignment;
        });
      },
      child: Text(label),
    );
  }

  Widget _mainSizeButton(MainAxisSize size, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _mainAxisSize == size ? Colors.orange : null,
      ),
      onPressed: () {
        setState(() {
          _mainAxisSize = size;
        });
      },
      child: Text(label),
    );
  }
}
