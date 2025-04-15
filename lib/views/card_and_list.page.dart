import 'package:flutter/material.dart';

class CardsAndList extends StatelessWidget {
  const CardsAndList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards and List'),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Cards and List',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              
              // Card avec image et actions
              _buildImageCard(context),
              const SizedBox(height: 16.0),

              // Card avec ListTiles
              _buildUsersCard(context),
              const SizedBox(height: 16.0),

              // ExpansionTile Card
              _buildExpansionCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCard(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Utiliser un placeholder pour l'image ou une image locale en production
          Container(
            height: 180,
            width: double.infinity,
            color: Colors.grey[300],
            child: const Center(
              child: Icon(Icons.image, size: 48, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Card avec une image',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Description de la carte avec une belle image',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('DÉTAILS'),
                ),
                const SizedBox(width: 8.0),
                FilledButton(
                  onPressed: () {},
                  child: const Text('ACTION'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsersCard(BuildContext context) {
    final users = [
      {'name': 'Emma Dupont', 'details': 'Designer UI/UX', 'icon': Icons.brush},
      {'name': 'Thomas Martin', 'details': 'Développeur Flutter', 'icon': Icons.code},
      {'name': 'Sophie Lefebvre', 'details': 'Chef de produit', 'icon': Icons.analytics},
    ];

    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.group, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 12.0),
                Text(
                  'Membres de l\'équipe',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          const Divider(height: 1.0),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: users.length,
            separatorBuilder: (context, index) => const Divider(height: 1.0, indent: 16.0, endIndent: 16.0),
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(user['icon'] as IconData, color: Theme.of(context).colorScheme.primary),
                ),
                title: Text(user['name'] as String),
                subtitle: Text(user['details'] as String),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionCard(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: const Text('Questions fréquentes'),
          leading: Icon(Icons.help_outline, color: Theme.of(context).colorScheme.primary),
          backgroundColor: Theme.of(context).colorScheme.surface,
          collapsedBackgroundColor: Theme.of(context).colorScheme.surface,
          childrenPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: [
            _buildFaqItem(
              'Comment utiliser cette application ?',
              'Suivez simplement les instructions affichées à l\'écran. Vous pouvez également consulter notre guide d\'utilisation dans la section Aide.',
            ),
            _buildFaqItem(
              'Comment contacter le support ?',
              'Vous pouvez nous contacter par email à support@example.com ou via le formulaire de contact dans la section Support.',
            ),
            _buildFaqItem(
              'L\'application est-elle gratuite ?',
              'Oui, l\'application de base est gratuite. Des fonctionnalités premium sont disponibles via un abonnement mensuel.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4.0),
          Text(answer),
        ],
      ),
    );
  }
}