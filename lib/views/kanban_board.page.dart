import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class KanbanPage extends StatefulWidget {
  @override
  _KanbanPageState createState() => _KanbanPageState();
}

class _KanbanPageState extends State<KanbanPage> {
  Map<String, List<String>> tasks = {
    'À faire': ['Tâche 1', 'Tâche 2'],
    'En cours': ['Tâche 3'],
    'Terminé': [],
  };

  String? draggedTask;
  String? sourceColumn;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void handleTaskDrop(String destinationColumn) {
    setState(() {
      tasks[sourceColumn!]!.remove(draggedTask);
      tasks[destinationColumn]!.add(draggedTask!);
      if (destinationColumn == 'Terminé') {
        _confettiController.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tableau Kanban')),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: tasks.keys.map((column) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DragTarget<String>(
                onWillAccept: (data) => true,
                onAccept: (data) {
                  handleTaskDrop(column);
                },
                builder: (context, candidateData, rejectedData) {
                  final isReceiving = candidateData.isNotEmpty;
                  return Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isReceiving ? Colors.blue[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        if (column == 'Terminé') ...[
                          ConfettiWidget(
                            confettiController: _confettiController,
                            blastDirection: pi / 2,
                            emissionFrequency: 0.05,
                            numberOfParticles: 20,
                            maxBlastForce: 20,
                            minBlastForce: 10,
                            gravity: 0.3,
                          ),
                          SizedBox(height: 8),
                        ],
                        Text(
                          column,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        ...tasks[column]!.map((task) {
                          return Draggable<String>(
                            data: task,
                            onDragStarted: () {
                              draggedTask = task;
                              sourceColumn = column;
                            },
                            feedback: Material(
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(task),
                                ),
                              ),
                            ),
                            childWhenDragging: Opacity(
                              opacity: 0.5,
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(task),
                                ),
                              ),
                            ),
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(task),
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
