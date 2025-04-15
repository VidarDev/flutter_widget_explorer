import 'package:flutter/material.dart';

class UseCaseSection extends StatelessWidget {
  const UseCaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cas d\'utilisation pratique',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('Filtres de recherche avec plusieurs options'),
        const SizedBox(height: 16),

        const Text(
          'Catégories:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            FilterChip(
              label: const Text('Tutoriels'),
              selected: true,
              onSelected: (bool selected) {},
              selectedColor: Colors.blue.shade100,
            ),
            FilterChip(
              label: const Text('Vidéos'),
              selected: false,
              onSelected: (bool selected) {},
            ),
            FilterChip(
              label: const Text('Articles'),
              selected: true,
              onSelected: (bool selected) {},
              selectedColor: Colors.blue.shade100,
            ),
            FilterChip(
              label: const Text('Podcasts'),
              selected: false,
              onSelected: (bool selected) {},
            ),
          ],
        ),

        const SizedBox(height: 16),
        const Text('Niveau:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            ChoiceChip(
              label: const Text('Débutant'),
              selected: true,
              onSelected: (bool selected) {},
              selectedColor: Colors.blue,
              labelStyle: const TextStyle(color: Colors.white),
            ),
            ChoiceChip(
              label: const Text('Intermédiaire'),
              selected: false,
              onSelected: (bool selected) {},
            ),
            ChoiceChip(
              label: const Text('Avancé'),
              selected: false,
              onSelected: (bool selected) {},
            ),
          ],
        ),

        const SizedBox(height: 16),
        const Text(
          'Tags populaires:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            Chip(
              label: const Text('Flutter'),
              backgroundColor: Colors.blue.shade50,
            ),
            Chip(
              label: const Text('State Management'),
              backgroundColor: Colors.green.shade50,
            ),
            Chip(
              label: const Text('UI Design'),
              backgroundColor: Colors.orange.shade50,
            ),
            Chip(
              label: const Text('API Integration'),
              backgroundColor: Colors.purple.shade50,
            ),
          ],
        ),
      ],
    );
  }
}
