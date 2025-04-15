import 'dart:async';

import 'package:flutter/material.dart';

class ProgressIndicatorsPage extends StatefulWidget {
  const ProgressIndicatorsPage({super.key});

  @override
  State<ProgressIndicatorsPage> createState() => _ProgressIndicatorsPageState();
}

class _ProgressIndicatorsPageState extends State<ProgressIndicatorsPage> {
  double _progress = 0.0;
  bool _isLoading = false;
  Timer? _timer;

  void _startLoading() {
    if (_isLoading) return;

    setState(() {
      _progress = 0.0;
      _isLoading = true;
    });

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _progress += 0.01;
        if (_progress >= 1.0) {
          _progress = 1.0;
          _isLoading = false;
          _timer?.cancel();
          _timer = null;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicators')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Indeterminate indicators section
            _buildSectionTitle('Indicateurs indéterminés'),
            _buildSectionDescription(
              'Ces indicateurs sont utilisés lorsque le temps de chargement est inconnu.',
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      width: 80,
                      height: 80,
                      child: CircularProgressIndicator(),
                    ),
                    const SizedBox(height: 16),
                    const Text('CircularProgressIndicator'),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      width: 200,
                      height: 20,
                      child: LinearProgressIndicator(),
                    ),
                    const SizedBox(height: 16),
                    const Text('LinearProgressIndicator'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Determinate indicators section
            _buildSectionTitle('Indicateurs déterminés'),
            _buildSectionDescription(
              'Ces indicateurs montrent la progression exacte d\'une tâche.',
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: CircularProgressIndicator(
                        value: _progress,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Progression: ${(_progress * 100).toStringAsFixed(0)}%',
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 20,
                      child: LinearProgressIndicator(
                        value: _progress,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Progression: ${(_progress * 100).toStringAsFixed(0)}%',
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Interactive example
            _buildSectionTitle('Exemple interactif'),
            _buildSectionDescription(
              'Cliquez sur le bouton pour simuler une tâche de chargement.',
            ),

            Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _isLoading ? null : _startLoading,
                    icon: const Icon(Icons.play_arrow),
                    label: Text(
                      _isLoading
                          ? 'Chargement en cours...'
                          : 'Démarrer la simulation',
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 300,
                    height: 20,
                    child: LinearProgressIndicator(
                      value: _isLoading ? _progress : 0.0,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.green,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _isLoading
                        ? 'Téléchargement en cours: ${(_progress * 100).toStringAsFixed(0)}%'
                        : _progress >= 1.0
                        ? 'Téléchargement terminé!'
                        : 'Prêt à démarrer',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Custom styled example
            _buildSectionTitle('Indicateurs personnalisés'),
            _buildSectionDescription(
              'Vous pouvez personnaliser les indicateurs avec différentes couleurs et styles.',
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: CircularProgressIndicator(
                        value: _progress,
                        backgroundColor: Colors.red[100],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.red,
                        ),
                        strokeWidth: 8,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Stroke épais, rouge'),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 10,
                      child: LinearProgressIndicator(
                        value: _progress,
                        backgroundColor: Colors.amber[100],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.amber,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Fin, ambre'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionDescription(String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        description,
        style: const TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}
