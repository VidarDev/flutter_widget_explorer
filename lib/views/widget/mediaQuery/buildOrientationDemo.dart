import 'package:flutter/material.dart';

class OrientationBuilderDemo extends StatefulWidget {
  const OrientationBuilderDemo({super.key});

  @override
  State<OrientationBuilderDemo> createState() => _OrientationBuilderDemoState();
}

class _OrientationBuilderDemoState extends State<OrientationBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Démonstration OrientationBuilder',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const SizedBox(height: 16),

            // OrientationBuilder pour s'adapter à l'orientation de l'écran
            MediaQuery(
              data: MediaQuery.of(context),
              child: OrientationBuilder(
                builder: (context, orientation) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color:
                          MediaQuery.orientationOf(context) ==
                                  Orientation.portrait
                              ? Colors.purple.shade100
                              : Colors.green.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Icône différente selon l'orientation
                          Icon(
                            MediaQuery.orientationOf(context) ==
                                    Orientation.portrait
                                ? Icons.arrow_downward
                                : Icons.arrow_forward,
                            size: 48,
                            color:
                                MediaQuery.orientationOf(context) ==
                                        Orientation.portrait
                                    ? Colors.purple
                                    : Colors.green,
                          ),
                          const SizedBox(height: 16),
                          // Texte différent selon l'orientation
                          Text(
                            MediaQuery.orientationOf(context) ==
                                    Orientation.portrait
                                ? 'MODE PORTRAIT'
                                : 'MODE PAYSAGE',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color:
                                  MediaQuery.orientationOf(context) ==
                                          Orientation.portrait
                                      ? Colors.purple
                                      : Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
