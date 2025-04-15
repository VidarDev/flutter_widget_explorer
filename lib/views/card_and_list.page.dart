import 'package:flutter/material.dart';

class CardsAndList extends StatelessWidget {
  const CardsAndList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards and List')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Cards and List'),
          Card(
            elevation: 4.0,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Titre de la carte', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.0), // Ajout d'un espace entre les textes
                  Text('Contenu de la carte'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}