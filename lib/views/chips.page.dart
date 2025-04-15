import 'package:flutter/material.dart';
import './widget/chips/chipsSection.dart';
import './widget/chips/choiceChipsSection.dart';
import './widget/chips/filterChipsSection.dart';
import './widget/chips/useCaseSection.dart';

class Chips extends StatefulWidget {
  const Chips({super.key});

  @override
  State<Chips> createState() => _ChipsState();
}

class _ChipsState extends State<Chips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chips, FilterChips, ChoiceChips')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ChipSection(),

            SizedBox(height: 32),

            FilterChipSection(),

            SizedBox(height: 32),

            ChoiceChipSection(),

            SizedBox(height: 32),

            UseCaseSection(),
          ],
        ),
      ),
    );
  }
}
