import 'package:flutter/material.dart';

class ChoiceChipSection extends StatefulWidget {
  const ChoiceChipSection({super.key});

  @override
  State<ChoiceChipSection> createState() => _ChoiceChipSectionState();
}

class _ChoiceChipSectionState extends State<ChoiceChipSection> {
  final List<String> _platforms = ['Android', 'iOS', 'Web', 'Desktop'];
  int _selectedPlatformIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ChoiceChip',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('Sélectionner une option parmi plusieurs'),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8.0,
          runSpacing: 12.0,
          children: List.generate(_platforms.length, (index) {
            return ChoiceChip(
              label: Text(_platforms[index]),
              selected: _selectedPlatformIndex == index,
              onSelected: (bool selected) {
                setState(() {
                  _selectedPlatformIndex = selected ? index : -1;
                });
              },
              selectedColor: Colors.blue,
              labelStyle: TextStyle(
                color:
                    _selectedPlatformIndex == index
                        ? Colors.white
                        : Colors.black,
              ),
            );
          }),
        ),
        const SizedBox(height: 12),
        Text(
          'Plateforme sélectionnée: ${_selectedPlatformIndex >= 0 ? _platforms[_selectedPlatformIndex] : "Aucune"}',
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}
