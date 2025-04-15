import 'package:flutter/material.dart';

class FilterChipSection extends StatefulWidget {
  const FilterChipSection({super.key});

  @override
  State<FilterChipSection> createState() => _FilterChipSectionState();
}

class _FilterChipSectionState extends State<FilterChipSection> {
  final List<String> _filterOptions = [
    'Flutter',
    'Dart',
    'Mobile',
    'Web',
    'Desktop',
  ];
  final Map<String, bool> _selectedFilters = {
    'Flutter': false,
    'Dart': false,
    'Mobile': false,
    'Web': false,
    'Desktop': false,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'FilterChip',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('Filtrer un contenu (sélectionné/désélectionné)'),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children:
              _filterOptions.map((filter) {
                return FilterChip(
                  label: Text(filter),
                  selected: _selectedFilters[filter] ?? false,
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedFilters[filter] = selected;
                    });
                  },
                  selectedColor: Colors.blue.shade100,
                  checkmarkColor: Colors.blue.shade800,
                  showCheckmark: true,
                );
              }).toList(),
        ),
        const SizedBox(height: 12),
        Text(
          'Filtres sélectionnés: ${_selectedFilters.entries.where((e) => e.value).map((e) => e.key).join(', ')}',
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}
