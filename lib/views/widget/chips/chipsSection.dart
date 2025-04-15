import 'package:flutter/material.dart';

class ChipSection extends StatefulWidget {
  const ChipSection({super.key});

  @override
  State<ChipSection> createState() => _ChipSectionState();
}

class _ChipSectionState extends State<ChipSection> {
  final List<String> _tags = ['Flutter', 'Dart', 'Mobile'];

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Chip',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('Chip de base'),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children:
              _tags.map((tag) {
                return Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue.shade900,
                    child: Text(
                      tag[0].toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  label: Text(tag),
                  deleteIcon: const Icon(Icons.cancel, size: 18),
                  onDeleted: () => _removeTag(tag),
                );
              }).toList(),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            if (_tags.length < 10) {
              final newTags = [
                'Android',
                'iOS',
                'React',
                'Prout',
              ].where((t) => !_tags.contains(t));
              if (newTags.isNotEmpty) {
                setState(() {
                  _tags.add(newTags.first);
                });
              }
            }
          },
          child: const Text('Ajouter un tag'),
        ),
      ],
    );
  }
}
