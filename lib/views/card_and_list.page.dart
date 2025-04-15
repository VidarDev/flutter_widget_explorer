import 'package:flutter/material.dart';

class CardsAndList extends StatelessWidget {
  const CardsAndList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards and List')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cards and List', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),

            // Card avec une image et des actions
            Card(
              elevation: 4.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://cdn.pixabay.com/photo/2025/03/18/17/03/dog-9478487_1280.jpg150',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 150,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Card avec une image',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  OverflowBar(
                    alignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('ACTION 1'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('ACTION 2'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Card avec plusieurs ListTiles
            Card(
              elevation: 4.0,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Utilisateur 1'),
                    subtitle: Text('Détails de l’utilisateur 1'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Utilisateur 2'),
                    subtitle: Text('Détails de l’utilisateur 2'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Utilisateur 3'),
                    subtitle: Text('Détails de l’utilisateur 3'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // ExpansionTile
            Card(
              elevation: 4.0,
              child: ExpansionTile(
                title: Text('ExpansionTile Exemple'),
                subtitle: Text('Cliquez pour développer'),
                leading: Icon(Icons.expand_more),
                children: [
                  ListTile(
                    title: Text('Élément 1'),
                  ),
                  ListTile(
                    title: Text('Élément 2'),
                  ),
                  ListTile(
                    title: Text('Élément 3'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}