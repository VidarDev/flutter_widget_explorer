import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class PuzzleTile {
  final int value;
  final int currentPosition;
  final int correctPosition;

  bool get isInCorrectPosition => currentPosition == correctPosition;

  const PuzzleTile({
    required this.value,
    required this.currentPosition,
    required this.correctPosition,
  });
}

class LongPressDraggablePage extends StatefulWidget {
  const LongPressDraggablePage({super.key});

  @override
  State<LongPressDraggablePage> createState() => _LongPressDraggablePageState();
}

class _LongPressDraggablePageState extends State<LongPressDraggablePage> {
  late List<PuzzleTile> tiles;
  late int emptyTilePos;
  int moveCount = 0;
  final random = Random();

  @override
  void initState() {
    super.initState();
    _initPuzzle();
  }

  void _initPuzzle() {
    // Créer les tuiles dans l'ordre
    tiles = [];
    for (int i = 0; i < 9; i++) {
      final value = i == 8 ? 0 : i + 1;
      tiles.add(
        PuzzleTile(value: value, currentPosition: i, correctPosition: i),
      );
    }
    emptyTilePos = 8;
    moveCount = 0;
  }

  bool _isSolved() => tiles.every((tile) => tile.isInCorrectPosition);

  bool _canMoveTile(int tilePos, int emptyPos) {
    // Même ligne, colonnes adjacentes
    if (tilePos ~/ 3 == emptyPos ~/ 3 &&
        (tilePos % 3 == emptyPos % 3 + 1 || tilePos % 3 == emptyPos % 3 - 1)) {
      return true;
    }

    // Même colonne, lignes adjacentes
    if (tilePos % 3 == emptyPos % 3 &&
        (tilePos ~/ 3 == emptyPos ~/ 3 + 1 ||
            tilePos ~/ 3 == emptyPos ~/ 3 - 1)) {
      return true;
    }

    return false;
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Félicitations!'),
            content: Text(
              'Vous avez résolu le puzzle en $moveCount mouvements!',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _shufflePuzzle();
                },
                child: const Text('Rejouer'),
              ),
            ],
          ),
    );
  }

  void _shufflePuzzle() {
    setState(() {
      // Effectuer 100 mouvements aléatoires valides
      for (int i = 0; i < 100; i++) {
        List<int> validMoves = [];

        // Trouver toutes les positions qui peuvent être déplacées
        for (int pos = 0; pos < 9; pos++) {
          if (_canMoveTile(pos, emptyTilePos)) {
            validMoves.add(pos);
          }
        }

        if (validMoves.isNotEmpty) {
          int randomMove = validMoves[random.nextInt(validMoves.length)];

          // Trouver la tuile à cette position
          final tileIndex = tiles.indexWhere(
            (tile) => tile.currentPosition == randomMove,
          );

          if (tileIndex != -1) {
            // Effectuer le mouvement
            final oldTilePos = tiles[tileIndex].currentPosition;

            tiles[tileIndex] = PuzzleTile(
              value: tiles[tileIndex].value,
              currentPosition: emptyTilePos,
              correctPosition: tiles[tileIndex].correctPosition,
            );

            emptyTilePos = oldTilePos;
          }
        }
      }

      moveCount = 0;
    });
  }

  // Obtenir la tuile à une position donnée
  PuzzleTile getTileAtPosition(int position) {
    for (var tile in tiles) {
      if (tile.currentPosition == position) {
        return tile;
      }
    }
    // Fallback - ne devrait jamais arriver
    return PuzzleTile(
      value: 0,
      currentPosition: position,
      correctPosition: position,
    );
  }

  Widget _buildTile(int position) {
    final tile = getTileAtPosition(position);

    // Espace vide
    if (tile.value == 0) {
      return DragTarget<PuzzleTile>(
        builder: (context, candidateData, rejectedData) {
          return Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
              border:
                  candidateData.isNotEmpty
                      ? Border.all(color: Colors.green, width: 3)
                      : null,
            ),
          );
        },
        onWillAccept: (incomingTile) {
          return incomingTile != null &&
              _canMoveTile(incomingTile.currentPosition, emptyTilePos);
        },
        onAccept: (incomingTile) {
          setState(() {
            final tileIndex = tiles.indexWhere(
              (t) => t.currentPosition == incomingTile.currentPosition,
            );

            if (tileIndex != -1) {
              final oldTilePos = incomingTile.currentPosition;

              tiles[tileIndex] = PuzzleTile(
                value: incomingTile.value,
                currentPosition: emptyTilePos,
                correctPosition: incomingTile.correctPosition,
              );

              emptyTilePos = oldTilePos;
              moveCount++;

              if (_isSolved()) {
                _showWinDialog();
              }
            }
          });

          HapticFeedback.mediumImpact();
        },
      );
    }

    // Tuile normale
    return LongPressDraggable<PuzzleTile>(
      data: tile,
      delay: const Duration(milliseconds: 500),
      hapticFeedbackOnStart: true,
      onDragStarted: () {
        if (_canMoveTile(tile.currentPosition, emptyTilePos)) {
          HapticFeedback.heavyImpact();
        }
      },
      feedback: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '${tile.value}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      childWhenDragging: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: tile.isInCorrectPosition ? Colors.green : Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            '${tile.value}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Puzzle Game')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Moves: $moveCount',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 300,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return _buildTile(index);
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _shufflePuzzle,
              child: const Text('Mélanger'),
            ),
          ],
        ),
      ),
    );
  }
}
